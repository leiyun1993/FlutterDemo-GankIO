import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gank_flutter/model/base_bean_entity.dart';
import 'package:gank_flutter/model/mei_zi_entity.dart';
import 'package:gank_flutter/utils/HttpUtils.dart';
import 'package:gank_flutter/utils/LogUtils.dart';
import 'package:gank_flutter/widget/meizi_item.dart';

class MeiZiPage extends StatefulWidget {
  @override
  _MeiZiPageState createState() => _MeiZiPageState();
}

class _MeiZiPageState extends State<MeiZiPage> {
  var _scrollController = new ScrollController(initialScrollOffset: 0);
  var _imageList = [];
  var _load = 0;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      var px = _scrollController.position.pixels;
      if (px == _scrollController.position.maxScrollExtent) {
        LogUtils.log("加载更多！");
        _onLoadMore();
      }
    });

    _initData(_page);
  }

  Future<void> _initData(int page) async {
    var map = Map();
    map["size"] = 10;
    map["page"] = page;
    var res = await HttpUtils.get("/data/福利/:size/:page", map);
    var newList = BaseBeanEntity.fromJsonList(res).getList<MeiZiEntity>();
    setState(() {
      if (page == 1) {
        _imageList.clear();
      }
      _imageList.addAll(newList); //results为数组
      if (newList == null || newList.length == 0) {
        _load = 3;
      } else {
        _load = 0;
      }
      _page++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("妹子"),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: RefreshIndicator(
              onRefresh: _onRefresh,
              child: StaggeredGridView.countBuilder(
                controller: _scrollController,
                padding: EdgeInsets.all(8),
                crossAxisCount: 4,
                itemCount: _imageList.length,
                itemBuilder: (BuildContext context, int index) {
                  MeiZiEntity item = _imageList[index];
                  return MeiZiItem(item);
                },
                staggeredTileBuilder: (int index) =>
                    new StaggeredTile.count(2, index == 0 ? 1.5 : 2),
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
              ),
            ),
          ),
          Offstage(
            offstage: _load != 2,
            child: Center(
              child: Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: SizedBox(
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                          width: 14,
                          height: 14,
                        ),
                        alignment: Alignment.centerRight,
                        margin: EdgeInsets.only(right: 10),
                      ),
                    ),
                    Expanded(
                      child: Text("加载更多..."),
                    )
                  ],
                ),
                padding: EdgeInsets.all(15),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> _onRefresh() async {
    setState(() {
      _page = 1;
      _load = 1;
    });
    await _initData(_page);
    print("_onRefresh");
  }

  Future<void> _onLoadMore() async {
    if (_load == 3) return;
    setState(() {
      _load = 2;
    });
    await _initData(_page);
    print("_onLoadMore");
  }
}

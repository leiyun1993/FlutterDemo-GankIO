import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gank_flutter/widget/meizi_item.dart';

class MeiZiPage extends StatefulWidget {
  @override
  _MeiZiPageState createState() => _MeiZiPageState();
}

class _MeiZiPageState extends State<MeiZiPage> {
  var _scrollController = new ScrollController(initialScrollOffset: 0);
  var _imageList = 10;
  var _load = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      var px = _scrollController.position.pixels;
      if (px == _scrollController.position.maxScrollExtent) {
        print("加载更多！");
        _onLoadMore();
      }
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
                itemCount: _imageList,
                itemBuilder: (BuildContext context, int index) => MeiZiItem(),
                staggeredTileBuilder: (int index) =>
                    new StaggeredTile.count(2, index == 0 ? 2.5 : 3),
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
              ),
            ),
          ),
Offstage(
  offstage: _load!=2,
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
    await Future.delayed(Duration(milliseconds: 1500));
    setState(() {
      _imageList = 10;
    });
    print("_onRefresh");
  }

  Future<void> _onLoadMore() async {

    setState(() {
      _load=2;
    });
    await await Future.delayed(Duration(milliseconds: 1500));
    setState(() {
      _imageList = _imageList + 5;
      _load=0;
    });
    print("_onLoadMore");
  }
}

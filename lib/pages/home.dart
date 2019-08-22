import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gank_flutter/icons/iconfont.dart';

class HomePage extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> with WidgetsBindingObserver {
  var _pageController = PageController(initialPage: 1, viewportFraction: 0.8);
  var _scrollController = ScrollController();
  static const _imageList = [
    "https://hbimg.huabanimg.com/fa7be73547c402acc9c7a1e8717cba4d87a487c51adaa-4aL4RO_fw658",
    "https://hbimg.huabanimg.com/621034b37c53ffc81f5d6a23ae1226d5c67e2b9628267-BYuZLo_fw658",
    "https://hbimg.huabanimg.com/78357472c41451bb06ddf8e1bf63f4fe38d054a32b5e4-IuY8EO_fw658",
    "https://hbimg.huabanimg.com/4ef3886fd17a74c9ae5c60ffffed13a62b49c7a33acdf-flB6An_fw658",
    "https://hbimg.huabanimg.com/a9d10755cdf6fef52d529a807810c937dd4c70552bb46-sAwWOc_fw658"
  ];

  var _newList = List();
  Timer _timer;
  var _index = 1;
  List _data = List();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _newList = _getImgList();
    _timer = Timer.periodic(Duration(milliseconds: 5000), _loopBanner);
    _data = _getData();
    print("initState");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    print("didChangeAppLifecycleState:$state");
  }

  List _getData() {
    var list = List();
    for (var i = 0; i < 30; i++) {
      list.add(i);
    }
    return list;
  }

  List _getImgList() {
    var list = List();
    var first = _imageList[0];
    var last = _imageList[_imageList.length - 1];
    list.add(last);
    list.addAll(_imageList);
    list.add(first);

    return list;
  }

  Widget _getWidget(int index) {
    if (index == 0) {
      return Container(
        height: 200,
        child: PageView.builder(
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  _newList[index],
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
          itemCount: _newList.length,
          controller: _pageController,
          onPageChanged: _onPageChange,
        ),
      );
    } else if (index < _data.length + 1) {
      var showText = _data[index - 1];

      return Container(
          padding: EdgeInsets.all(10),
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "$showText Flutter demo item title label!Flutter demo item title label!Flutter demo item title label!Flutter demo item title label!Flutter demo item title label!",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        height: 10,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            IconFont.iconzuozhe,
                            color: Colors.green,
                            size: 20,
                          ),
                          Text("testUser"),
                          Container(
                            width: 10,
                          ),
                          Icon(
                            IconFont.iconshijian,
                            color: Colors.green,
                            size: 20,
                          ),
                          Text("2019-8-20"),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: 15,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.network(
                  "https://hbimg.huabanimg.com/a9d10755cdf6fef52d529a807810c937dd4c70552bb46-sAwWOc_fw658",
                  alignment: Alignment.centerRight,
                  width: 80,
                  height: 80,
                ),
              )
            ],
          ));
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        title: Center(
          child: Text(
            "首页",
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: ListView.separated(
          controller: _scrollController,
          itemBuilder: (context, index) {
            return _getWidget(index);
          },
          separatorBuilder: (context, index) {
            return new Container(
              height: 1,
              color: index == 0 ? Colors.transparent : Color(0xfff5f5f5),
            );
          },
          itemCount: _data.length + 1,
        ),
      ),
    );
  }

  void _onPageChange(int index) {
    setState(() {
      _index = index;
    });
    if (index == 0) {
      if (_pageController.hasClients) {
        _pageController.jumpToPage(_newList.length - 2);
      }
    } else if (index == _newList.length - 1) {
      if (_pageController.hasClients) {
        _pageController.jumpToPage(1);
      }
    }
  }

  void _loopBanner(Timer timer) {
    _index++;
    if (_index > _newList.length - 2) {
      _index = 1;
    }
    _pageController.animateToPage(_index,
        duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
  }

  @override
  void didUpdateWidget(HomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    print("deactivate");
    _timer.cancel();
    super.deactivate();
  }

  @override
  void dispose() {
    print("dispose");
    super.dispose();
  }

  Future<void> _onRefresh() async {
    print("_onRefresh");
    await Future.delayed(Duration(milliseconds: 1500));
  }
}

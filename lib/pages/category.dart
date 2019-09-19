import 'package:flutter/material.dart';
import 'package:gank_flutter/widget/article_list.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<CategoryPage> with SingleTickerProviderStateMixin {
  var _tabList = ["all", "Android", "iOS", "App","前端","拓展资源","瞎推荐","休息视频"];
  TabController _tabController;


  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0,length: _tabList.length,vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _tabList.length,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              brightness: Brightness.light,
              title: Center(
                child: Text(
                  "分类",
                ),
              ),
              bottom: TabBar(
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.label,
                isScrollable: true,
                onTap: _onTabBarTap,
                tabs: _tabList.map((item) {
                  return Tab(text: item);
                }).toList(),
              ),
            ),
            body: TabBarView(
              controller: _tabController,
              children: _tabList.map((item) {
                return Center(
                  child: ArticleList(item),
                );
              }).toList(),
            )));
  }

  void _onTabBarTap(int value) {

  }
}

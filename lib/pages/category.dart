import 'package:flutter/material.dart';
import 'package:gank_flutter/widget/article_list.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<CategoryPage> {
  var _tabList = ["All", "Android", "iOS", "Web"];
  var _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = DefaultTabController.of(context);
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
                tabs: _tabList.map((item) {
                  return Tab(text: item);
                }).toList(),
              ),
            ),
            body: TabBarView(
              children: _tabList.map((item) {
                return Center(
                  child: ArticleList(),
                );
              }).toList(),
            )));
  }
}

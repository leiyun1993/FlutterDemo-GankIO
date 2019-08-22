import 'package:flutter/material.dart';
import 'package:gank_flutter/widget/article_item.dart';

class ArticleList extends StatefulWidget {
  @override
  _ArticleListState createState() {
    return _ArticleListState();
  }
}

class _ArticleListState extends State<ArticleList> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: ListView.separated(
        itemBuilder: (context, index) {
          return ArticleItem();
        },
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            height: 1,
            color: Color(0xffe5e5e5),
          );
        },
        itemCount: 10,
      ),
    );
  }

  Future<void> _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1500));
  }
}

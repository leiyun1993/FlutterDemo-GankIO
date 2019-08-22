import 'package:flutter/material.dart';
import 'package:gank_flutter/icons/iconfont.dart';

class ArticleItem extends StatefulWidget {

  @override
  _ArticleItemState createState() {
    return _ArticleItemState();
  }
}

class _ArticleItemState extends State<ArticleItem> {
  @override
  Widget build(BuildContext context) {
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
                        "Flutter demo item title label!Flutter demo item title label!Flutter demo item title label!Flutter demo item title label!Flutter demo item title label!",
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
        ));;
  }
}


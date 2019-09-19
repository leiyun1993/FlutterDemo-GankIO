import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("关于"),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(15),
        child: ListView(
          children: <Widget>[
            Text(
              "Gank.io",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Container(
              margin: EdgeInsets.only(top: 15, bottom: 15),
              color: Color(0xffe5e5e5),
              width: MediaQuery.of(context).size.width,
              height: 1,
            ),
            Text("每日分享妹子图 和 技术干货，还有供大家中午休息的休闲视频。"),
            GestureDetector(
              child: Text(
                "http://gank.io",
                style: TextStyle(color: Colors.blue),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Text(
                "Flutter",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 15, bottom: 15),
              color: Color(0xffe5e5e5),
              width: MediaQuery.of(context).size.width,
              height: 1,
            ),
            Text(
                "Flutter是谷歌的移动UI框架，可以快速在iOS和Android上构建高质量的原生用户界面。 Flutter可以与现有的代码一起工作。在全世界，Flutter正在被越来越多的开发者和组织使用，并且Flutter是完全免费、开源的。"),
            GestureDetector(
              child: Text(
                "https://flutterchina.club",
                style: TextStyle(color: Colors.blue),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Text(
                "gank_flutter",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 15, bottom: 15),
              color: Color(0xffe5e5e5),
              width: MediaQuery.of(context).size.width,
              height: 1,
            ),
            Text("使用Gank提供的开放Api加上Flutter开发的跨平台App,目前测试了Android平台。"),
            GestureDetector(
              child: Text(
                "https://github.com/leiyun1993/FlutterDemo-GankIO",
                style: TextStyle(color: Colors.blue),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Text(
                "开源库",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 15, bottom: 15),
              color: Color(0xffe5e5e5),
              width: MediaQuery.of(context).size.width,
              height: 1,
            ),
            GestureDetector(
              child: Text(
                "https://github.com/letsar/flutter_staggered_grid_view",
                style: TextStyle(color: Colors.blue),
              ),
            ),
            GestureDetector(
              child: Text(
                "https://www.iconfont.cn",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

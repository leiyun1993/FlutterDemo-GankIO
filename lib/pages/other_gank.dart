import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OtherGank extends StatelessWidget {
  final String content;

  OtherGank({Key key, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var args=ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("其他Gank项目"),
      ),
      body: Center(child: Text(args==null?content:args)),
    );
  }
}

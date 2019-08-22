import 'package:flutter/material.dart';

class MeiZiItem extends StatefulWidget {
  @override
  _MeiZiItemState createState() {
    return _MeiZiItemState();
  }
}

class _MeiZiItemState extends State<MeiZiItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Color(0xff999999), blurRadius: 2, offset: Offset(0.5, 0.5))
      ], borderRadius: BorderRadius.circular(4)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: <Widget>[
            Container(
              child: Image.network(
                "http://ww1.sinaimg.cn/large/0065oQSqly1g2pquqlp0nj30n00yiq8u.jpg",
                fit: BoxFit.cover,
              ),
              constraints: BoxConstraints.expand(),
            ),
            Container(
              constraints:
                  BoxConstraints.expand(width: double.infinity, height: 30),
              child: Center(
                child: Text(
                  "2018-02-06",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

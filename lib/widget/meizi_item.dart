import 'package:flutter/material.dart';

class MeiZiItem extends StatefulWidget {

  MeiZiItem(this.url);

  String url;

  @override
  _MeiZiItemState createState() {
    return _MeiZiItemState();
  }
}

class _MeiZiItemState extends State<MeiZiItem> {

  _MeiZiItemState();

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
                widget.url,
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

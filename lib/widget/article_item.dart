import 'package:flutter/material.dart';
import 'package:gank_flutter/icons/iconfont.dart';
import 'package:gank_flutter/model/article_entity.dart';

class ArticleItem extends StatefulWidget {
  final ArticleEntity item;

  ArticleItem(this.item);

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
                        widget.item.desc,
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
                        Text(widget.item.who),
                        Container(
                          width: 10,
                        ),
                        Icon(
                          IconFont.iconshijian,
                          color: Colors.green,
                          size: 20,
                        ),
                        Text(widget.item.createdAt.substring(0, 10)),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: 15,
            ),
            Offstage(
              offstage: widget.item.images==null||widget.item.images.length==0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.network(
                  widget.item.images!=null&&widget.item.images.length>0?widget.item.images[0]:"https://hbimg.huabanimg.com/fa7be73547c402acc9c7a1e8717cba4d87a487c51adaa-4aL4RO_fw658",
                  alignment: Alignment.centerRight,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ));
    ;
  }
}

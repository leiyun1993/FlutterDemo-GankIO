import 'package:flutter/material.dart';
import 'package:gank_flutter/icons/iconfont.dart';
import 'package:gank_flutter/pages/about.dart';
import 'package:gank_flutter/pages/other_gank.dart';
import 'package:gank_flutter/utils/LogUtils.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfff5f5f5),
      child: Column(
        children: <Widget>[
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(bottom: BorderSide(color: Color(0xffe5e5e5)))),
            child: Row(
              children: <Widget>[
                Center(
                  child: Container(
                    width: 80,
                    height: 80,
                    margin: EdgeInsets.only(left: 30, top: 50),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.network(
                        "https://hbimg.huabanimg.com/fa7be73547c402acc9c7a1e8717cba4d87a487c51adaa-4aL4RO_fw658",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 30, top: 50),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                "YunLei",
                                style: TextStyle(
                                    fontSize: 26, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(top: 6),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Text(
                                      "Gank账号：test123@gank.io",
                                      style:
                                          TextStyle(color: Color(0xff666666)),
                                    ),
                                  ),
                                  Icon(
                                    IconFont.iconright,
                                    color: Color(0xff666666),
                                    size: 15,
                                  ),
                                  Container(
                                    width: 15,
                                    height: 0,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 16),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                    top: BorderSide(color: Color(0xffe5e5e5)),
                    bottom: BorderSide(color: Color(0xffe5e5e5)))),
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15, 20, 10, 20),
                  child: Icon(
                    IconFont.iconsearch,
                    color: Colors.green,
                    size: 30,
                  ),
                ),
                Expanded(
                  child: Text(
                    "搜索干货",
                    style: TextStyle(
                      color: Color(0xff1a1a1a),
                      fontSize: 18,
                    ),
                  ),
                ),
                Icon(
                  IconFont.iconright,
                  color: Color(0xff666666),
                  size: 18,
                ),
                Container(
                  width: 15,
                  height: 0,
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(bottom: BorderSide(color: Color(0xffe5e5e5)))),
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15, 20, 10, 20),
                  child: Icon(
                    IconFont.iconhistory,
                    color: Colors.green,
                    size: 30,
                  ),
                ),
                Expanded(
                  child: Text(
                    "历史干货",
                    style: TextStyle(
                      color: Color(0xff1a1a1a),
                      fontSize: 18,
                    ),
                  ),
                ),
                Icon(
                  IconFont.iconright,
                  color: Color(0xff666666),
                  size: 18,
                ),
                Container(
                  width: 15,
                  height: 0,
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () async {
//              Navigator.push(context, MaterialPageRoute(builder: (context) => (OtherGank(content: "这是route传递的参数",))));
              var res = await Navigator.pushNamed(context, "/other",
                  arguments: "这是route传递的参数");
              LogUtils.log(res);
            },
            child: Container(
              margin: EdgeInsets.only(top: 16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      top: BorderSide(color: Color(0xffe5e5e5)),
                      bottom: BorderSide(color: Color(0xffe5e5e5)))),
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15, 20, 10, 20),
                    child: Icon(
                      IconFont.icongithub,
                      color: Colors.green,
                      size: 30,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "其他Gank项目",
                      style: TextStyle(
                        color: Color(0xff1a1a1a),
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Icon(
                    IconFont.iconright,
                    color: Color(0xff666666),
                    size: 18,
                  ),
                  Container(
                    width: 15,
                    height: 0,
                  )
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(bottom: BorderSide(color: Color(0xffe5e5e5)))),
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15, 20, 10, 20),
                  child: Icon(
                    IconFont.iconlike,
                    color: Colors.green,
                    size: 30,
                  ),
                ),
                Expanded(
                  child: Text(
                    "点赞",
                    style: TextStyle(
                      color: Color(0xff1a1a1a),
                      fontSize: 18,
                    ),
                  ),
                ),
                Icon(
                  IconFont.iconright,
                  color: Color(0xff666666),
                  size: 18,
                ),
                Container(
                  width: 15,
                  height: 0,
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/about");
//              Navigator.push(context, MaterialPageRoute(builder: (context) => (About())));
            },
            child: Container(
              margin: EdgeInsets.only(top: 16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      top: BorderSide(color: Color(0xffe5e5e5)),
                      bottom: BorderSide(color: Color(0xffe5e5e5)))),
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15, 20, 10, 20),
                    child: Icon(
                      IconFont.iconabout,
                      color: Colors.green,
                      size: 30,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "关于",
                      style: TextStyle(
                        color: Color(0xff1a1a1a),
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Icon(
                    IconFont.iconright,
                    color: Color(0xff666666),
                    size: 18,
                  ),
                  Container(
                    width: 15,
                    height: 0,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

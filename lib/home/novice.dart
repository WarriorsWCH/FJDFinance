import 'package:flutter/material.dart';


class Novice extends StatelessWidget {
  Novice({Key key}) : super(key: key);

  final redStyle = TextStyle(fontSize: 13.0, color:Colors.red, fontWeight: FontWeight.w500);
  final greyStyle = TextStyle(fontSize: 12.0, color:Color(0xFF999999));
  final blackStyle = TextStyle(fontSize: 13.0, fontWeight: FontWeight.w500);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 146.0,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(width: 0.5,color: Color(0xffdddddd))
        )
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
              decoration: BoxDecoration(
                // color: Colors.red,
                border: Border(
                  right: BorderSide(width: 0.5, color: Color(0xffdddddd))
                )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '下载APP',
                        style: blackStyle,
                      ),
                      Text(
                        '送888元礼包',
                        style: redStyle,
                      ),
                    ],
                  ),
                  Text(
                    '新手专享',
                    style: greyStyle
                  ),
                  Image.network(
                    'http://img12.360buyimg.com/jrpmobile/jfs/t10384/155/1759179594/9776/185bd062/59e5f0ebNec4cf494.png?width=100&height=100',
                    width: 66.0,
                    height: 66.0
                  )
                ],
              ),
            )
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    // symmetric vertical上下 horizontal左右
                    padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 14.0),
                    decoration: BoxDecoration(
                      // color: Colors.green,
                      border: Border(
                        bottom: BorderSide(width: 0.5, color: Color(0xffdddddd))
                      )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Column(
                            // x轴排列方式
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '领128元新手礼包',
                                style: redStyle,
                                softWrap: false,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                '立即开通',
                                style: greyStyle,
                              )
                            ],
                          ),
                        ),
                        Image.network(
                          'http://img12.360buyimg.com/jrpmobile/jfs/t4639/162/1782623297/60754/98ea03b4/58e60952N7fdb2b85.png?width=200&height=200',
                          width: 40.0,
                          height: 40.0
                        )
                      ],
                    ),
                  )
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    // symmetric vertical上下 horizontal左右
                    padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 14.0),
                    decoration: BoxDecoration(
                      // color: Colors.green,
                      border: Border(
                        bottom: BorderSide(width: 0.5, color: Color(0xffdddddd))
                      )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Column(
                            // x轴排列方式
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(
                                    '打白条',
                                    style: blackStyle,
                                  ),
                                  Text(
                                    '享免息',
                                    style: redStyle,
                                  ),
                                ],
                              ),
                              Text(
                                '立即开通享豪礼',
                                style: greyStyle,
                              )
                            ],
                          ),
                        ),
                        Image.network(
                          'http://img12.360buyimg.com/jrpmobile/jfs/t4804/179/657713323/5908/66dce262/58e6095fNd3dc3f39.png?width=100&height=100',
                          width: 40.0,
                          height: 40.0
                        )
                      ],
                    ),
                  )
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
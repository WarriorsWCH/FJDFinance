import 'package:flutter/material.dart';
import '../model/items.dart';
import './btn_items.dart';

class Footer extends StatelessWidget {
  Footer({Key key}) : super(key : key);

  List<Item> items = [
    Item('http://img12.360buyimg.com/jrpmobile/jfs/t2971/333/1297567079/898/f2d2e00d/577dc28dNe5138337.png?width=108&height=108','客户端', ''),
    Item('http://img12.360buyimg.com/jrpmobile/jfs/t2824/256/2966087355/831/188bfa25/577cf3dcN18aadbf2.png?width=108&height=108','触屏版', ''),
    Item('http://img12.360buyimg.com/jrpmobile/jfs/t2920/282/1283157010/1040/23f1430b/577cf3e5N53f740b8.png?width=108&height=108','电脑版', ''),
  ];
  List<String> list = ['Copyright © 2004-2017 京东JD.com 版权所有',
  '投资有风险，购买需谨慎',
  '京东金融平台服务协议',
  '京东金融隐私政策'];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(list.length+1, (index){
        if (index == 0) {
          return BtnItems(items: items, top: 10.0, bottom: 15.0,bgcolor: Color(0xFFf5f5f5),);
        } else {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 12.0),
            decoration: BoxDecoration(
              //  color: Colors.white,
              border: Border(
                top: BorderSide(width: 0.5,color: Color(0xffdddddd))
              )
            ),
            child: Align(
              child: Text(
                list[index-1],
                style:TextStyle(color: Color(0xFF999999),fontSize: 12.0)
              ),
            ),
          );
        }
      }),
    );
  }
}
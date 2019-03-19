import 'package:flutter/material.dart';
import '../model/items.dart';

class BtnItems extends StatelessWidget {
  BtnItems({Key key, @required this.items, this.bgcolor = Colors.white,
  this.top = 0, this.bottom = 0}) : super(key : key);

  List<Item> items = [];
  final double top;
  final double bottom;
  final Color bgcolor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, top, 0, bottom),
      color: bgcolor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(items.length, (index) {
          return Expanded(
            // width: 64.0,
            flex: 1,
            child: Column(
              // flex -> just-content -> spaceBetween
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.network(items[index].img,width: 45.0, height: 45.0),
                Container(
                  margin: EdgeInsets.only(top: 5.0),
                  child: Text(
                    items[index].text,
                    style: TextStyle(fontSize: 13.0),
                    softWrap: false, //单行
                    overflow: TextOverflow.ellipsis, //省略号
                  ),
                ),
                 items[index].sub != '' ? Text(
                  items[index].sub,
                  style: TextStyle(fontSize: 13.0, color: Color(0xFFFF801A)),
                ) : Container(height: 0,),
              ],
            ),
          );
        }),
      ),
    );
  }

  List<Widget> _buildItem() {
    List<Widget> list = List();
    for (var i = 0; i < items.length; i++) {
      list.add(ConstrainedBox(
        // 限制每个item的宽高
        constraints: BoxConstraints.expand(
          width: 64.0, 
          height: 67.0
        ),
        child: Column(
          // flex -> just-content -> spaceBetween
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Image.network(items[i].img,width: 45.0, height: 45.0),
            Text(
              items[i].text,
              style: TextStyle(fontSize: 13.0),
            ),
            items[i].sub == '' ? Text(
              items[i].sub,
              style: TextStyle(fontSize: 13.0, color: Color(0xFFFF801A)),
            ) : Container(height: 0,),
          ],
        ),
      ));
    }
    return list;
  }
}
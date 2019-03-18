import 'package:flutter/material.dart';
import '../model/items.dart';

class BtnItems extends StatelessWidget {
  BtnItems({Key key, this.items}) : super(key : key);

  List<Item> items = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 20.0, 0, 10.0),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(items.length, (index) {
          return ConstrainedBox(
            // 限制每个item的宽高
            constraints: BoxConstraints.expand(
              width: 64.0, 
              height: 67.0
            ),
            child: Column(
              // flex -> just-content -> spaceBetween
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.network(items[index].img,width: 45.0, height: 45.0),
                Text(
                  items[index].text,
                  style: TextStyle(fontSize: 13.0),
                )
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
            )
          ],
        ),
      ));
    }
    return list;
  }
}
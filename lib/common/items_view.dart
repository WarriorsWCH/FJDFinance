import 'package:flutter/material.dart';

class ItemsView extends StatelessWidget {
  ItemsView({Key key, this.items}) : super(key : key);

  List items = [];

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.fromLTRB(0, 20.0, 0, 10.0),
      color: Colors.white,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: buildItem(),
      ),
    );
  }

  List<Widget> buildItem() {
    List<Widget> list = new List();
    for (var i = 0; i < items.length; i++) {
      list.add(new ConstrainedBox(
        // 限制每个item的宽高
        constraints: new BoxConstraints.expand(
          width: 64.0, 
          height: 67.0
        ),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Image.network(items[i].img,width: 45.0, height: 45.0),
            new Text(
              items[i].text,
              style: new TextStyle(fontSize: 13.0),
            )
          ],
        ),
      ));
    }
    return list;
  }
}
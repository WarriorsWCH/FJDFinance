import 'package:flutter/material.dart';
import '../model/items.dart';

class Finance extends StatelessWidget {
  Finance({Key key, this.list, this.color}) : super(key: key);

  final List<Item> list;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 16.0),
        height: list.length * 70.0,
        decoration: BoxDecoration(
          border: Border(top: BorderSide(width: 0.5, color: Color(0xffdddddd))),
          color: Colors.white,
        ),
        child: ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              // color: Colors.red,
              padding: EdgeInsets.fromLTRB(0, 10.0, 15.0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 16.0),
                    child: Image.network(
                      list[index].img,
                      width: 44.0,
                      height: 44.0,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(list[index].text,style: TextStyle(fontSize: 18.0),),
                      Text(list[index].sub, style:TextStyle(fontSize: 12.0,color:color),)
                    ],
                  ),
                  Spacer(),
                  Text(
                    '去赚钱 >',
                    style: TextStyle(fontSize: 14.0,color: Color(0xffFF801A)),
                  )
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              color: Color(0xffdddddd),
              indent: 60.0,
            );
          },
        ));
  }
}

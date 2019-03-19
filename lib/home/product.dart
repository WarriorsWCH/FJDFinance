import 'package:flutter/material.dart';


class Product extends StatelessWidget {
  Product({Key key, this.list}) : super(key : key);

  final List<String> list;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 161.0,
      color: Colors.white,
      padding: EdgeInsets.only(bottom: 20.0),
      child: ListView.builder(
          // 横向滚动
          scrollDirection: Axis.horizontal,
          itemCount: list.length,
          itemBuilder: (BuildContext content, int index) {
            return Container(
              width: 120.0,
              height: 157.0,
              margin: index+1 == list.length ? 
                      EdgeInsets.symmetric(horizontal: 6.0) : 
                      EdgeInsets.only(left: 6.0),
              child: Image.network(list[index]),
            );
          }
      ),
    );
  }
}
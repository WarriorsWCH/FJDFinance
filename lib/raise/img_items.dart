import 'package:flutter/material.dart';

class ImageItems extends StatelessWidget {
  ImageItems({Key key, @required this.items, this.bgcolor = Colors.white,
  this.top = 0, this.bottom = 0}) : super(key : key);

  List<String> items = [];
  final double top;
  final double bottom;
  final Color bgcolor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, top, 0, bottom),
      color: bgcolor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(items.length, (index) {
          return Expanded(
            flex: 1,
            child: Image.network(items[index]),
          );
        }),
      ),
    );
  }
}
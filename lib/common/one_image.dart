import 'package:flutter/material.dart';

class OneImage extends StatelessWidget {
  OneImage({Key key, @required this.img, this.height, this.marginTop = 0,
  this.left = 0, this.top = 0, this.right = 0, this.bottom = 0}) : super(key : key);

  final String img;
  final double height;
  final double left;
  final double top;
  final double right;
  final double bottom;
  final double marginTop;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      // constraints: BoxConstraints.expand(
      //   height: height
      // ),
      margin: EdgeInsets.fromLTRB(0, marginTop, 0, 0),
      padding: EdgeInsets.fromLTRB(left, top, right, bottom),
      // color: Colors.white,
      // child: Image.network(img),
      decoration: BoxDecoration(
        // 背景颜色
        color: Colors.white,
        // 背景图片
        image: DecorationImage(
          image: NetworkImage(img),
          // 图片位置
          alignment: Alignment.topCenter
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';


class Rslider extends StatelessWidget {
  Rslider({Key key, this.list}) : super(key : key);

  List<String> list = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffffffff),
      // 限制轮播图高度
      constraints: BoxConstraints.expand(
        height: 36,
        // width: 72,
      ),
      child: Swiper(
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context,int index){
          return Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 9),
                height: 36,
                // color: Colors.green,
                child: Text(
                  list[index],
                  style:TextStyle(fontSize:14,color:Color(0xff333333))
                ),
              ),
              Positioned(
                right: 10,
                top: 10,
                child: Text('>',style: TextStyle(color: Color(0xffdddddd)),),
              )
            ],
          );
        },
        itemCount: list.length,
        // 自动播放开关
        autoplay: true,
      ),
    );
  }
}
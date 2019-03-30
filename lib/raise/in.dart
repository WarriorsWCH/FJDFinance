import 'package:flutter/material.dart';
import '../model/ins.dart';

class In extends StatelessWidget {
  In({Key key, this.list}) : super (key : key);

  List<Ins> list;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(bottom: 20),
      child: Row(
        children: List.generate(list.length, (index) {
          return Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      // height: 22.0,
                    ),
                    Positioned(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 4.0),
                        color:  Color(0XFFC1C1C1),
                        child: Text(
                          '精选',
                          style: TextStyle(
                            // backgroundColor: Color(0XFFC1C1C1),
                            color: Color(0xffff0000),
                            fontSize: 10.0,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Image.network(list[index].img,width: 90,height: 90,),
                ),
                Text(
                  list[index].title,
                  style:TextStyle(
                    fontSize: 14.0,
                    color:Color(0xff444444),
                    fontWeight: FontWeight.bold
                  )
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      '￥${list[index].price}',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xffFF3232),
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      '起',
                      style: TextStyle(fontSize: 10,color: Color(0xff999999),fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 8),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(
                            height: 5.0,
                            width: 72,
                            decoration: BoxDecoration(
                              color: Color(0xffF6E6E6),
                              borderRadius: BorderRadius.circular(11)
                            ),
                          ),
                          Positioned(
                            child: Container(
                              height: 5,
                              width: list[index].progress >= 100 ? 72 : 72 * list[index].progress/100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(11),
                                gradient: LinearGradient(
                                colors: [
                                  Color(0xFFFF5555),
                                  Color(0xFFFF9C31),
                                ],
                                begin: FractionalOffset(1, 0),
                                end: FractionalOffset(0, 1)),
                              ),
                            ),
                          )
                        ],
                      ),
                      Text(
                        '${list[index].progress}%',
                        style:TextStyle(fontSize: 12,color:Color(0xff999999))
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
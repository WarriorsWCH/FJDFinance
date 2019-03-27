import 'package:flutter/material.dart';
import '../model/money.dart';

class Money extends StatelessWidget {
  Money({Key key, @required this.data}) : super(key : key);

  final List<MoneyItem> data;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        // ~/ 除法，返回一个整数结果，其实就是取商
        children: List.generate((data.length/2).ceil(), (index) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 17.0),
            decoration: BoxDecoration(
              border: data.length > (index + 1)*2 ? Border(
                bottom: BorderSide(width: 0.5, color: Color(0xffdddddd))
              ) : Border.all(width: 0,color: Colors.white)
            ),
            child: Row(
              children: <Widget>[
                _buildItem(index*2),
                _buildItem(index*2 + 1),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _buildItem(index) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          border: Border(left: BorderSide(
            width: 0.5, color: Color(0xffdddddd)
          ))
        ),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                data[index].title,
                style:TextStyle(fontSize: 15.0, color: Color(0xFF333333), fontWeight: FontWeight.w500)
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffff5155),width: 1.0)
                ),
                child: Text(
                  data[index].sub,
                  style: TextStyle(color: Color(0xffff5155),fontWeight: FontWeight.w500,fontSize: 11.0),
                ),
              )
            ],
          ),
          Text(
            data[index].rate,
            style: TextStyle(fontSize: 22.0,color: Color(0xFFFF5155)),
          ),
          Text(
             data[index].text,
             style: TextStyle(fontSize: 12.0, color: Color(0xFF999999)),
          )
        ],
      ),
    
      ),
    );
  }
}
import 'package:flutter/material.dart';

class IousPage extends StatefulWidget {

  @override
  _IousPageState createState() => new _IousPageState();
}

class _IousPageState extends State<IousPage> {

  @override // 重写
  Widget build(BuildContext context) {
    // 返回一个Material风格的组件
    return new Center(
      child: new Text('ious'),
    );
  }
}
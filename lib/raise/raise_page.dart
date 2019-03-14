import 'package:flutter/material.dart';

class RaisePage extends StatefulWidget {

  @override
  _RaisePageState createState() => new _RaisePageState();
}

class _RaisePageState extends State<RaisePage> {

  @override // 重写
  Widget build(BuildContext context) {
    // 返回一个Material风格的组件
    return new Center(
      child: new Text('raise'),
    );
  }
}
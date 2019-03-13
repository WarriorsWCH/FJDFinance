import 'package:flutter/material.dart';

class RaisePage extends StatelessWidget {
  @override // 重写
  Widget build(BuildContext context) {
    // 返回一个Material风格的组件
    return MaterialApp(
        title: '京东金融',
        home: new Center(
          child: new Text('raise'),
        )
    );
  }
}
import 'package:flutter/material.dart';
import 'index/index.dart';

//主函数 入口函数
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override // 重写
  Widget build(BuildContext context) {
    // 返回一个Material风格的组件
    return MaterialApp(
        title: '京东金融',
        home: new Index()
    );
  }
}
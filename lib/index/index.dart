import 'package:flutter/material.dart';
import '../home/home_page.dart';
import '../ious/ious_page.dart';
import '../money/money_page.dart';
import '../raise/raise_page.dart';
import 'navigation_icon_view.dart';


class Index extends StatefulWidget {
  @override
  State<Index> createState() => new _IndexState();
}

class _IndexState extends State<Index> with TickerProviderStateMixin {

  // 当前选中的bar
  int _currentIndex = 0;
  List<NavigationIconView> _navigationViews = new List();
  List<StatefulWidget> _pageList;
  StatefulWidget _currentPage;

  List<String> appBarTitles = ['首页', '理财', '白条', '众筹'];
  List<String> appBarIcons = ['images/home.png','images/money.png',
  'images/ious.png','images/raise.png'];
  
  /*
  * 在对象插入到树中时调用
  * 框架将为它创建的每个State（状态）对象调用此方法一次
  * 覆盖此方法可以实现此对象被插入到树中的位置的初始化
  * 或用于配置此对象上的控件的位置的初始化
  */
  @override
  void initState() {
    super.initState();
    // 循环存储NavigationIconView类的列表里添加内容
    for (var i = 0; i < 4; i++) {
      _navigationViews.add(new NavigationIconView(
        icon: new Image.asset(appBarIcons[i], width: 24.0, height: 24.0),
        title: new Text(appBarTitles[i]),
        vsync: this,
      ));
    }
    // 循环调用存储NavigationIconView类的列表的值
    for (NavigationIconView view in _navigationViews) {
      // 每次动画控制器的值更改时调用侦听器
      view.controller.addListener(_rebuild);
      // 底部导航栏当前选择的动画控制器的值为1.0
      _navigationViews[_currentIndex].controller.value = 1.0;
    }

    _pageList = <StatefulWidget>[
      new HomePage(),
      new MoneyPage(),
      new IousPage(),
      new RaisePage()
    ];
    _currentPage =_pageList[_currentIndex];
  }

  // 动画控制器的值更改时的操作
  void _rebuild() {
    // 通知框架此对象的内部状态已更改
    setState(() {
      // 重建，以便为视图创建动画
    });
  }

  // 释放此对象使用的资源
  @override
  void dispose() {
    super.dispose();
    for (NavigationIconView view in _navigationViews) {
      // 调用此方法后，对象不再可用
      view.controller.dispose();
    }
  }
  
  @override
  Widget build(BuildContext context) {
    // 局部变量，创建底部导航栏
    final BottomNavigationBar bottomNavigationBar = new BottomNavigationBar(
      /*
      * 在底部导航栏中布置的交互项：迭代存储NavigationIconView类的列表
      * 返回此迭代的每个元素的底部导航栏项目
      * 创建包含此迭代的元素的列表
      */
        items: _navigationViews.map(
          (NavigationIconView navigationIconView) => navigationIconView.item
        ).toList(),
        // 当前活动项的索引：存储底部导航栏的当前选择
        currentIndex: _currentIndex,
        // 当前活动项的颜色
        fixedColor: Colors.red,
        // 底部导航栏的布局和行为：存储底部导航栏的布局和行为
        type: BottomNavigationBarType.fixed,
        // 当点击项目时调用的回调
        onTap: (int index) {
          setState(() {
            // 当前选择的底部导航栏项目，开始反向运行此动画
            _navigationViews[_currentIndex].controller.reverse();
            _currentIndex = index;
            // 当前选择的底部导航栏项目，开始向前运行此动画
            _navigationViews[_currentIndex].controller.forward();
            _currentPage =_pageList[_currentIndex];
          });
        },
    );

    return MaterialApp(
        home: new Scaffold(
            appBar: new AppBar(
              title: new Text(
                appBarTitles[_currentIndex],
                style: TextStyle(color: Colors.black),
              ),
              backgroundColor: Colors.white,

            ),
            body: new Center(
              child: _currentPage,
            ),
            bottomNavigationBar: bottomNavigationBar,
        ),
      );
  }
}

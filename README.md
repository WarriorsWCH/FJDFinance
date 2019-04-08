# app页面

### 首页

<div style="display:flex">
<img src="https://github.com/WarriorsWCH/FJDFinance/blob/master/UI/1.jpg?raw=true" width="200" alt="首页"/>
<img src="https://github.com/WarriorsWCH/FJDFinance/blob/master/UI/2.jpg?raw=true" width="200" alt="首页"/>
<img src="https://github.com/WarriorsWCH/FJDFinance/blob/master/UI/3.jpg?raw=true" width="200" alt="首页"/>
<img src="https://github.com/WarriorsWCH/FJDFinance/blob/master/UI/4.jpg?raw=true" width="200" alt="首页"/>
</div>

### 理财

<div style="display:flex">
<img src="https://github.com/WarriorsWCH/FJDFinance/blob/master/UI/5.jpg?raw=true" width="200" alt="理财"/>
<img src="https://github.com/WarriorsWCH/FJDFinance/blob/master/UI/6.jpg?raw=true" width="200" alt="理财"/>
</div>

### 白条

<div style="display:flex">
<img src="https://github.com/WarriorsWCH/FJDFinance/blob/master/UI/7.jpg?raw=true" width="200" alt="白条"/>
<img src="https://github.com/WarriorsWCH/FJDFinance/blob/master/UI/8.jpg?raw=true" width="200" alt="白条"/>
</div>

### 众筹

<div style="display:flex">
<img src="https://github.com/WarriorsWCH/FJDFinance/blob/master/UI/9.jpg?raw=true" width="200" alt="众筹"/>
<img src="https://github.com/WarriorsWCH/FJDFinance/blob/master/UI/10.jpg?raw=true" width="200" alt="众筹"/>
<img src="https://github.com/WarriorsWCH/FJDFinance/blob/master/UI/11.jpg?raw=true" width="200" alt="众筹"/>
</div>

#### 底部导航封装，带动画

```
import 'package:flutter/material.dart';
import '../home/home_page.dart';
import '../ious/ious_page.dart';
import '../money/money_page.dart';
import '../raise/raise_page.dart';
import 'navigation_icon_view.dart';


class Index extends StatefulWidget {
  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> with TickerProviderStateMixin {

  // 当前选中的bar
  int _currentIndex = 0;
  List<NavigationIconView> _navigationViews = List();
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
      _navigationViews.add(NavigationIconView(
        icon: Image.asset(appBarIcons[i], width: 24.0, height: 24.0),
        title: Text(appBarTitles[i]),
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
      HomePage(),
      MoneyPage(),
      IousPage(),
      RaisePage()
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
    final BottomNavigationBar bottomNavigationBar = BottomNavigationBar(
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
        home: Scaffold(
            appBar: AppBar(
              title: Text(
                appBarTitles[_currentIndex],
                style: TextStyle(color: Colors.black),
              ),
              backgroundColor: Colors.white,

            ),
            body: Center(
              child: _currentPage,
            ),
            bottomNavigationBar: bottomNavigationBar,
        ),
      );
  }
}

```

```
import 'package:flutter/material.dart';

// 创建类，导航图标视图
class NavigationIconView {
  // 导航图标视图的构造函数
  NavigationIconView({
    // 控件参数，传递图标
    Widget icon,
    // 控件参数，传递标题
    Widget title,
    // 控件参数，传递颜色
    Color color,
    /*
    * Ticker提供者
    * 由类实现的接口，可以提供Ticker对象
    *  Ticker对象：每个动画帧调用它的回调一次
    */
    TickerProvider vsync,
  })  : _icon = icon, //接收传递的图标
        // 接收传递的颜色
        _color = color,
        // 创建底部导航栏项目
        item = BottomNavigationBarItem(
            // 项目的图标
            icon: icon,
            // 项目的标题
            title: title
        ),
        // 创建动画控制器
        controller = AnimationController(
          // 动画持续的时间长度：默认情况下主题更改动画的持续时间
          duration: kThemeAnimationDuration,
          // 垂直同步
          vsync: vsync,
        ) {
            // 创建曲线动画
            _animation = CurvedAnimation(
              // 应用曲线动画的动画
              parent: controller,
              /*
              * 正向使用的曲线：
              * 从0.5
              * 到1.0结束
              * 应用的曲线：快速启动并缓和到最终位置的曲线
              */
              curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
            );
          }



  // 类成员，存储图标
  final Widget _icon;
  // 类成员，存储颜色
  final Color _color;
  // 类成员，底部导航栏项目
  final BottomNavigationBarItem item;
  // 类成员，动画控制器
  final AnimationController controller;
  // 类成员，曲线动画
  CurvedAnimation _animation;
  /*
  * 类函数，过渡转换
  * BottomNavigationBarType：定义底部导航栏的布局和行为
  * BuildContext：处理控件树中的控件
  */
  FadeTransition transition(
      BottomNavigationBarType type, 
      BuildContext context
  ) {
    // 局部变量，存储图标颜色
    Color iconColor;
    // 如果底部导航栏的位置和大小在点击时会变大
    if (type == BottomNavigationBarType.shifting) {
      // 存储颜色作为图标颜色
      iconColor = _color;
    } else {
      /*
      * 保存质感设计主题的颜色和排版值：
      * 使用ThemeData来配置主题控件
      * 使用Theme.of获取当前主题
      */
      final ThemeData themeData = Theme.of(context);
      /*
      * 如果程序整体主题的亮度很高（需要深色文本颜色才能实现可读的对比度）
      * 就返回程序主要部分的背景颜色作为图标颜色
      * 否则返回控件的前景颜色作为图标颜色
      */
      iconColor = themeData.brightness == Brightness.light
          ? themeData.primaryColor
          : themeData.accentColor;
    }
    // 返回值，创建不透明度转换
    var tween = Tween<Offset>(
      // 此变量在动画开头的值
      begin: const Offset(0.0, 0.02),
      // 此变量在动画结尾处的值：左上角
      end: Offset.zero,
    );
    return FadeTransition(
        // 控制子控件不透明度的动画
        opacity: _animation,
        // 子控件：创建滑动转换过渡
        child: SlideTransition(
            /*
            * 控制子控件位置的动画
            * 开始值和结束值之间的线性插值<以尺寸的分数表示的偏移量>
            *  （1.0，0.0）表示Size的右上角
            *  （0.0，1.0）表示Size的左下角
            */
            position: tween.animate(_animation), // 返回给定动画，该动画接受由此对象确定的值
            // 子控件：创建控制子控件的颜色，不透明度和大小的图标主题
            child: IconTheme(
              // 用于子控件中图标的颜色，不透明度和大小
              data: IconThemeData(
                // 图标的默认颜色
                color: iconColor,
                // 图标的默认大小
                size: 120.0,
              ),
              // 子控件
              child: _icon,
            )
        )
    );
  }
}

```

#### 轮播图封装
```
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';


class SliderView extends StatelessWidget {
  SliderView({Key key, this.imgHeight: 137.0, this.imgs}) : super(key : key);
  final imgHeight;
  List<String> imgs = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      // 限制轮播图高度
      constraints: BoxConstraints.expand(
        height: imgHeight,
      ),
      child: Swiper(
        itemBuilder: (BuildContext context,int index){
          return Image.network(imgs[index],fit: BoxFit.fill,);
        },
        itemCount: imgs.length,
        // 设置 SwiperPagination() 展示默认分页指示器
        pagination: SwiperPagination(
            margin: EdgeInsets.all(0.0),
            builder: SwiperCustomPagination(builder:
                (BuildContext context, SwiperPluginConfig config) {

              // 这个控件的作用是添加额外的限制条件（constraints）到child上
              return ConstrainedBox(
                // 分期控制器的高度
                constraints: BoxConstraints.expand(height: 15.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        // 分页控制器
                        child: DotSwiperPaginationBuilder(
                                color: Colors.black12,
                                activeColor: const Color(0xFF007aff),
                                size: 5.0,
                                activeSize: 5.0)
                            .build(context, config),
                      ),
                    )
                  ],
                ),
              );
        })),   
        // 自动播放开关
        autoplay: true,
      ),
    );
  }
}

```

#### 底部组件封装
```
import 'package:flutter/material.dart';
import '../model/items.dart';
import './btn_items.dart';

class Footer extends StatelessWidget {
  Footer({Key key}) : super(key : key);

  List<Item> items = [
    Item('http://img12.360buyimg.com/jrpmobile/jfs/t2971/333/1297567079/898/f2d2e00d/577dc28dNe5138337.png?width=108&height=108','客户端', ''),
    Item('http://img12.360buyimg.com/jrpmobile/jfs/t2824/256/2966087355/831/188bfa25/577cf3dcN18aadbf2.png?width=108&height=108','触屏版', ''),
    Item('http://img12.360buyimg.com/jrpmobile/jfs/t2920/282/1283157010/1040/23f1430b/577cf3e5N53f740b8.png?width=108&height=108','电脑版', ''),
  ];
  List<String> list = ['Copyright © 2004-2017 京东JD.com 版权所有',
  '投资有风险，购买需谨慎',
  '京东金融平台服务协议',
  '京东金融隐私政策'];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(list.length+1, (index){
        if (index == 0) {
          return BtnItems(items: items, top: 10.0, bottom: 15.0,bgcolor: Color(0xFFf5f5f5),);
        } else {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 12.0),
            decoration: BoxDecoration(
              //  color: Colors.white,
              border: Border(
                top: BorderSide(width: 0.5,color: Color(0xffdddddd))
              )
            ),
            child: Align(
              child: Text(
                list[index-1],
                style:TextStyle(color: Color(0xFF999999),fontSize: 12.0)
              ),
            ),
          );
        }
      }),
    );
  }
}
```
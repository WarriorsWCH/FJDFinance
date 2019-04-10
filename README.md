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

#### 组件封装

- 底部导航栏
<img src="https://github.com/WarriorsWCH/FJDFinance/blob/master/UI/12.jpg?raw=true" width="300" alt=""/>

导航条主要使用的是MaterialApp中的bottomNavigationBar，

```
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
```

创建底部导航栏,通过迭代存储NavigationIconView类的列表关联四个页面

```
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
```

通过自定义NavigationIconView来实现动画效果，点击每个导航项相应的文字有变大效果

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

- 轮播图封装
<img src="https://github.com/WarriorsWCH/FJDFinance/blob/master/UI/13.jpg?raw=true" width="300" alt=""/>

轮播图主要是使用的是第三方flutter_swiper插件，可以自定义分页控制器，简单好用，功能齐全

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

- 通用按钮项

<img src="https://github.com/WarriorsWCH/FJDFinance/blob/master/UI/14.jpg?raw=true" width="300" alt=""/>

自适应按钮大小，类似前端的flex，主要使用Row、Column、Expanded组合使用

```
import 'package:flutter/material.dart';
import '../model/items.dart';

class BtnItems extends StatelessWidget {
  BtnItems({Key key, @required this.items, this.bgcolor = Colors.white,
  this.top = 0, this.bottom = 0}) : super(key : key);

  List<Item> items = [];
  final double top;
  final double bottom;
  final Color bgcolor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, top, 0, bottom),
      color: bgcolor,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(items.length, (index) {
          return Expanded(
            // width: 64.0,
            flex: 1,
            child: Column(
              // flex -> just-content -> spaceBetween
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.network(items[index].img,width: 45.0, height: 45.0),
                Container(
                  margin: EdgeInsets.only(top: 5.0),
                  child: Text(
                    items[index].text,
                    style: TextStyle(fontSize: 13.0),
                    softWrap: false, //单行
                    overflow: TextOverflow.ellipsis, //省略号
                  ),
                ),
                 items[index].sub != '' ? Text(
                  items[index].sub,
                  style: TextStyle(fontSize: 13.0, color: Color(0xFFFF801A)),
                ) : Container(height: 0,),
              ],
            ),
          );
        }),
      ),
    );
  }

  List<Widget> _buildItem() {
    List<Widget> list = List();
    for (var i = 0; i < items.length; i++) {
      list.add(ConstrainedBox(
        // 限制每个item的宽高
        constraints: BoxConstraints.expand(
          width: 64.0, 
          height: 67.0
        ),
        child: Column(
          // flex -> just-content -> spaceBetween
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Image.network(items[i].img,width: 45.0, height: 45.0),
            Text(
              items[i].text,
              style: TextStyle(fontSize: 13.0),
            ),
            items[i].sub == '' ? Text(
              items[i].sub,
              style: TextStyle(fontSize: 13.0, color: Color(0xFFFF801A)),
            ) : Container(height: 0,),
          ],
        ),
      ));
    }
    return list;
  }
}
```

- 首页的理财精选

<img src="https://github.com/WarriorsWCH/FJDFinance/blob/master/UI/15.jpg?raw=true" width="300" alt=""/>

主要使用的是 ListView.separated()方法，separatorBuilder: (BuildContext context, int index) {}可以设置下划线

```
import 'package:flutter/material.dart';
import '../model/items.dart';

class Finance extends StatelessWidget {
  Finance({Key key, this.list, this.color}) : super(key: key);

  final List<Item> list;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 16.0),
        height: list.length * 70.0,
        decoration: BoxDecoration(
          border: Border(top: BorderSide(width: 0.5, color: Color(0xffdddddd))),
          color: Colors.white,
        ),
        child: ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              // color: Colors.red,
              padding: EdgeInsets.fromLTRB(0, 10.0, 15.0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 16.0),
                    child: Image.network(
                      list[index].img,
                      width: 44.0,
                      height: 44.0,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(list[index].text,style: TextStyle(fontSize: 18.0),),
                      Text(list[index].sub, style:TextStyle(fontSize: 12.0,color:color),)
                    ],
                  ),
                  Spacer(),
                  Text(
                    '去赚钱 >',
                    style: TextStyle(fontSize: 14.0,color: Color(0xffFF801A)),
                  )
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              color: Color(0xffdddddd),
              indent: 60.0,
            );
          },
        ));
  }
}

```

- 众筹页的理财精选

<img src="https://github.com/WarriorsWCH/FJDFinance/blob/master/UI/16.jpg?raw=true" width="300" alt=""/>

主要是定位的使用，Stack和Positioned

```
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
```
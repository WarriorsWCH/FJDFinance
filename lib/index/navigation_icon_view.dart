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

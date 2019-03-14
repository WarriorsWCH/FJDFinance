import 'package:flutter/material.dart';
import '../common/slider_view.dart';
import '../common/items_view.dart';


class Item {
  String img;
  String text;
  Item(this.img, this.text);
}

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  List<String> imgs = ['http://img12.360buyimg.com/jrpmobile/jfs/t13465/324/2563794460/43029/3ffca963/5a421f83Ne8089231.jpg?width=750&height=320',
  'http://img12.360buyimg.com/jrpmobile/jfs/t16138/325/817844900/36681/5d874455/5a422029Ncd678ea3.jpg?width=750&height=320',
  'http://img12.360buyimg.com/jrpmobile/jfs/t13744/11/2508939408/43213/58bfe502/5a421ff3N52d0a474.jpg?width=750&height=320'];


  List<Item> items = [new Item('http://img12.360buyimg.com/jrpmobile/jfs/t3991/64/2521945388/12110/93c0139/58d1e462Ncf294123.png?width=132&height=132', '优惠券'),
  new Item('http://img12.360buyimg.com/jrpmobile/jfs/t5590/252/875247023/17343/946aa72c/59224650N0f7ffc92.png?width=132&height=132', '领红包'),
  new Item('http://img12.360buyimg.com/jrpmobile/jfs/t4393/329/2180608902/13217/c88c0cec/58ec9dcdN1534e2d7.png?width=132&height=132', '抢钢镚'),
  new Item('http://img12.360buyimg.com/jrpmobile/jfs/t4618/115/2179710654/11347/bf520df/58ec9d84Nfd169001.png?width=132&height=132', '领京豆'),
  new Item('http://img12.360buyimg.com/jrpmobile/jfs/t5488/298/1036263348/12073/b4f4de97/590ac8e8Ne9def22e.png?width=135&height=135', '白条提额'),];
  @override // 重写
  Widget build(BuildContext context) {
    // 返回一个Material风格的组件
    return new Container(
      color: new Color(0xfff5f5f5),
      child: new Column(
        children: <Widget>[
          new SliderView(
            imgs: imgs
          ),
          new ItemsView(
            items: items,
          )
        ],
      ),
    );
  }
}
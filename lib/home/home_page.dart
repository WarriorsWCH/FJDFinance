import 'package:flutter/material.dart';
import '../common/slider_view.dart';
import '../common/btn_items.dart';
import '../common/panel.dart';
import './novice.dart';
import '../common/one_image.dart';
import '../model/items.dart';
import '../model/money.dart';
import './money.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  List<String> imgs = ['http://img12.360buyimg.com/jrpmobile/jfs/t13465/324/2563794460/43029/3ffca963/5a421f83Ne8089231.jpg?width=750&height=320',
  'http://img12.360buyimg.com/jrpmobile/jfs/t16138/325/817844900/36681/5d874455/5a422029Ncd678ea3.jpg?width=750&height=320',
  'http://img12.360buyimg.com/jrpmobile/jfs/t13744/11/2508939408/43213/58bfe502/5a421ff3N52d0a474.jpg?width=750&height=320'];


  List<Item> items = [Item('http://img12.360buyimg.com/jrpmobile/jfs/t3991/64/2521945388/12110/93c0139/58d1e462Ncf294123.png?width=132&height=132', '优惠券'),
  Item('http://img12.360buyimg.com/jrpmobile/jfs/t5590/252/875247023/17343/946aa72c/59224650N0f7ffc92.png?width=132&height=132', '领红包'),
  Item('http://img12.360buyimg.com/jrpmobile/jfs/t4393/329/2180608902/13217/c88c0cec/58ec9dcdN1534e2d7.png?width=132&height=132', '抢钢镚'),
  Item('http://img12.360buyimg.com/jrpmobile/jfs/t4618/115/2179710654/11347/bf520df/58ec9d84Nfd169001.png?width=132&height=132', '领京豆'),
  Item('http://img12.360buyimg.com/jrpmobile/jfs/t5488/298/1036263348/12073/b4f4de97/590ac8e8Ne9def22e.png?width=135&height=135', '白条提额'),];

  List<MoneyItem> data = [
    MoneyItem("定期理财","理财首选","5.60%","历史年化回报率"),
    MoneyItem("小白理财","理财首选","4.22%","7日年化收益率"),
    MoneyItem("月月盈","养老保障","5%","7日年化收益率"),
    MoneyItem("小白基金","天天赚钱","4.27%","7日年化收益率"),
  ];
  @override // 重写
  Widget build(BuildContext context) {
    // 返回一个Material风格的组件
    return SingleChildScrollView(
        child: Container(
          color: Color(0xfff5f5f5),
          child: Column(
            children: <Widget>[
              SliderView(
                imgs: imgs
              ),
              BtnItems(
                items: items,
              ),
              Panel(
                title: '新手特权'
              ),
              Novice(),
              Panel(
                title: '极速借贷'
              ),
              OneImage(
                img: 'http://img12.360buyimg.com/jrpmobile/jfs/t12721/42/2497849749/26333/ec584be4/5a421756N2416c88f.png?width=750&height=280',
                bottom: 20.0,
                height: 139.0,
              ),
              Panel(
                title: '理财精选'
              ),
              Money(
                data: data,
              ),
              Panel(
                title: '新品推荐',
                more: '更多尖货',
              ),
              OneImage(
                img: 'http://img12.360buyimg.com/jrpmobile/jfs/t2842/350/3035567089/14791/5f6ff93d/577cf395N31e76288.png?width=1125&height=252',
                height: 72.0,
                marginTop: 10.0,
              ),
            ],
          ),
        ),
    );
  }
}
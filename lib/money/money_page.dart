import 'package:flutter/material.dart';
import '../common/slider_view.dart';
import '../common/finance.dart';
import '../common/panel.dart';
import '../common/one_image.dart';
import '../common/footer.dart';
import '../model/items.dart';
import '../model/money.dart';
import '../common/money.dart';

class MoneyPage extends StatefulWidget {

  @override
  _MoneyPageState createState() => _MoneyPageState();
}

class _MoneyPageState extends State<MoneyPage> {

  List<String> imgs = ['http://img12.360buyimg.com/jrpmobile/jfs/t11149/181/856008463/68797/dc303e9/59f97baeN3cdae084.jpg?width=750&height=400',
  'http://img12.360buyimg.com/jrpmobile/jfs/t9994/205/2575467053/189117/125e7b05/59f97c36N7599be57.png?width=750&height=400',];

  List<MoneyItem> data = [
    MoneyItem("定期理财","理财首选","5.60%","历史年化回报率"),
    MoneyItem("小白理财","理财首选","4.22%","7日年化收益率"),
    MoneyItem("月月盈","养老保障","5%","7日年化收益率"),
    MoneyItem("小白基金","天天赚钱","4.27%","7日年化收益率"),
  ];

  List<Item> items = [Item('http://img12.360buyimg.com/jrpmobile/jfs/t3670/58/543125556/2606/a65096b9/580d80afN63b1085a.png?width=76&height=76', '月度理财', '预期年化收益率4.50%'),
  Item('http://img12.360buyimg.com/jrpmobile/jfs/t3679/44/511862277/2728/c1c6b2bf/580d8189N6b6f8052.png?width=76&height=76', '季度理财', '历史年化回报率5.50%'),
  Item('http://img12.360buyimg.com/jrpmobile/jfs/t3331/69/580199498/3074/d5bb21c5/580d7f6cN7f35e596.png?width=76&height=76', '一年理财', '历史年化回报率5.80%'),];

  @override // 重写
  Widget build(BuildContext context) {
    // 返回一个Material风格的组件
      return Container(
        color: Color(0xfff5f5f5),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SliderView(
                imgs: imgs
              ),
              OneImage(
                img: 'http://img12.360buyimg.com/jrpmobile/jfs/t5842/235/8356236245/38364/2112fd7e/597a95d4Ne01da140.png?width=750&height=270',
                marginTop: 10.0,
                height: 135.0,
              ),
              Panel(
                title: '银行精选'
              ),
              Money(
                data: data,
              ),
              OneImage(
                img: 'http://img12.360buyimg.com/jrpmobile/jfs/t10876/23/2566835181/40527/d7d27c08/59f97d68Ne53fda5b.png?width=1080&height=240',
                height: 71.0,
                marginTop: 10.0,
              ),
              Panel(
                title: '理财精选'
              ),
              Finance(list:items),
              OneImage(
                img: 'http://img12.360buyimg.com/jrpmobile/jfs/t7162/219/4755741/18941/4e51a5aa/597b066dNf6c7a972.jpg?width=750&height=120',
                height: 60.0,
                marginTop: 10.0,
              ),
              Footer()
            ],
          ),
        ),
    );
  
  }
}
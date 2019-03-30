import 'package:flutter/material.dart';
import '../common/slider_view.dart';
import '../common/btn_items.dart';
import '../common/panel.dart';
import './novice.dart';
import '../common/one_image.dart';
import '../model/items.dart';
import '../model/money.dart';
import '../common/money.dart';
import './product.dart';
import '../common/footer.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  List<String> imgs = ['http://img12.360buyimg.com/jrpmobile/jfs/t13465/324/2563794460/43029/3ffca963/5a421f83Ne8089231.jpg?width=750&height=320',
  'http://img12.360buyimg.com/jrpmobile/jfs/t16138/325/817844900/36681/5d874455/5a422029Ncd678ea3.jpg?width=750&height=320',
  'http://img12.360buyimg.com/jrpmobile/jfs/t13744/11/2508939408/43213/58bfe502/5a421ff3N52d0a474.jpg?width=750&height=320'];


  List<Item> items1 = [Item('http://img12.360buyimg.com/jrpmobile/jfs/t3991/64/2521945388/12110/93c0139/58d1e462Ncf294123.png?width=132&height=132', '优惠券', ''),
  Item('http://img12.360buyimg.com/jrpmobile/jfs/t5590/252/875247023/17343/946aa72c/59224650N0f7ffc92.png?width=132&height=132', '领红包', ''),
  Item('http://img12.360buyimg.com/jrpmobile/jfs/t4393/329/2180608902/13217/c88c0cec/58ec9dcdN1534e2d7.png?width=132&height=132', '抢钢镚', ''),
  Item('http://img12.360buyimg.com/jrpmobile/jfs/t4618/115/2179710654/11347/bf520df/58ec9d84Nfd169001.png?width=132&height=132', '领京豆', ''),
  Item('http://img12.360buyimg.com/jrpmobile/jfs/t5488/298/1036263348/12073/b4f4de97/590ac8e8Ne9def22e.png?width=135&height=135', '白条提额', ''),];

  List<Item> items2 = [Item('http://img12.360buyimg.com/jrpmobile/jfs/t4375/104/1184122472/3976/89741da4/58be8a6eNf10193d0.png?width=135&height=135', '惠加油', ''),
    Item('http://img12.360buyimg.com/jrpmobile/jfs/t4747/185/1901740991/5892/1383fb93/58f57851N17ee6993.jpg?width=132&height=132', '小白信用', '全新升级'),
    Item('http://img12.360buyimg.com/jrpmobile/jfs/t3241/234/8044685271/3713/7b29f77f/58be89c8Nb9d41295.png?width=135&height=135', '信用卡还款', ''),
    Item('http://img12.360buyimg.com/jrpmobile/jfs/t3172/259/7993557249/4351/fd082707/58be8a81Nd7716a06.png?width=135&height=135', '卡转让', ''),
    Item('http://img12.360buyimg.com/jrpmobile/jfs/t3085/320/8107659086/4344/cdbba2dd/58be8acfNdadcaf00.png?width=135&height=135', '定期还款', ''),];

  List<MoneyItem> data = [
    MoneyItem("定期理财","理财首选","5.60%","历史年化回报率"),
    MoneyItem("小白理财","理财首选","4.22%","7日年化收益率"),
    MoneyItem("月月盈","养老保障","5%","7日年化收益率"),
    MoneyItem("小白基金","天天赚钱","4.27%","7日年化收益率"),
  ];

  List<String> list = [
    'http://img12.360buyimg.com/jrpmobile/jfs/t13963/267/2355123229/48850/254f797a/5a3c59aeN9cb550f6.jpg?width=335&height=421',
    'http://img12.360buyimg.com/jrpmobile/jfs/t13021/306/1996997425/21953/bda69db3/5a2f6a17N9da099b1.jpg?width=335&height=421',
    'http://img12.360buyimg.com/jrpmobile/jfs/t14125/310/1997192193/46667/3c910f8b/5a2f6a36Nad95b650.jpg?width=335&height=421',
    'http://img12.360buyimg.com/jrpmobile/jfs/t15784/188/381232069/39444/8878571d/5a2f6a4aNbd5a574c.jpg?width=335&height=421'
  ];

  double screenWidth = 0;
  @override // 重写
  Widget build(BuildContext context) {
    this.screenWidth = MediaQuery.of(context).size.width;

    // 返回一个Material风格的组件
    return Container(
        color: Color(0xfff5f5f5),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SliderView(
                imgs: imgs,
                imgHeight: screenWidth*137/320,
              ),
              BtnItems(
                items: items1,
                top: 20.0,
                bottom: 10.0,
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
                height: screenWidth*139/320,
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
              Product(
                list: list,
              ),
              Panel(
                title: '生活服务'
              ),
              BtnItems(
                items: items2,
                bottom: 20.0,
              ),
              OneImage(
                img: 'http://img12.360buyimg.com/jrpmobile/jfs/t2842/350/3035567089/14791/5f6ff93d/577cf395N31e76288.png?width=1125&height=252',
                height: screenWidth*72/320,
                marginTop: 10.0,
              ),
              Footer()
            ],
          ),
        ),
    );
  
  }
}
import 'package:flutter/material.dart';
import '../common/slider_view.dart';
import '../common/finance.dart';
import '../common/panel.dart';
import '../common/one_image.dart';
import '../common/footer.dart';
import '../model/items.dart';
import '../common/btn_items.dart';


class IousPage extends StatefulWidget {

  @override
  _IousPageState createState() => _IousPageState();
}

class _IousPageState extends State<IousPage> {

  List<String> imgs = ['http://img12.360buyimg.com/jrpmobile/jfs/t8491/303/504628479/60643/100648de/59a94358N92475fca.jpg?width=750&height=320',
  'http://img12.360buyimg.com/jrpmobile/jfs/t8437/321/1758527686/40952/f66d552f/59bf1f41N50d846f9.jpg?width=750&height=320',];

  List<Item> items1 = [Item('http://img12.360buyimg.com/jrpmobile/jfs/t4609/245/3975151339/11019/766e751d/590aca78Nf15a7947.png?width=135&height=135', '小白卡', ''),
  Item('http://img12.360buyimg.com/jrpmobile/jfs/t5269/224/1031852465/12646/40e0f799/590aca55N22a6f274.png?width=135&height=135', '白条商城', ''),
  Item('http://img12.360buyimg.com/jrpmobile/jfs/t5095/216/1045040184/12370/564ae632/590ac7deN9a0eac2a.png?width=135&height=135', '消费分期', ''),
  Item('http://img12.360buyimg.com/jrpmobile/jfs/t8311/300/1385281399/9501/130a0046/59b8da06N14f62cf3.png?width=120&height=120', '借钱', ''),];
  List<Item> items2 = [Item('http://img12.360buyimg.com/jrpmobile/jfs/t5488/298/1036263348/12073/b4f4de97/590ac8e8Ne9def22e.png?width=135&height=135', '白条提额', ''),
  Item('http://img12.360buyimg.com/jrpmobile/jfs/t4417/98/4154366136/13785/5433ca92/590ac8afN5dd91d6e.png?width=135&height=135', '白条闪付', ''),
  Item('http://img12.360buyimg.com/jrpmobile/jfs/t4453/75/4132459214/14188/939b7f34/590ac860N752d5738.png?width=135&height=135', '小白会玩', ''),
  Item('http://img12.360buyimg.com/jrpmobile/jfs/t5371/323/1038197138/12031/3ec72f6c/590aca20N089fd34a.png?width=135&height=135', '钢镚', ''),
  ];


  List<Item> items = [Item('http://img12.360buyimg.com/jrpmobile/jfs/t4378/62/155957680/9017/16463551/58affd58Nb5c9198e.jpg?width=120&height=120', '开通白条', '送188元礼包'),
  Item('http://img12.360buyimg.com/jrpmobile/jfs/t4150/330/141981421/9147/604e3e04/58affc3bNbfa8f9d7.jpg?width=120&height=120', '白条闪付', '新手享158元礼包'),
  Item('http://img12.360buyimg.com/jrpmobile/jfs/t4270/96/1102370053/8651/58b7fa5a/58bd2e10N453e9464.jpg?width=120&height=120', '白条提额', '金融app专享提额礼包'),];

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
              Panel(
                title: '白条福利'
              ),
              Finance(list:items, color: Color(0xff999999),),
              Panel(
                title: '更多服务'
              ),
              BtnItems(
                items: items1,
                top: 20.0,
                bottom: 10.0,
              ),
              BtnItems(
                items: items2,
                top: 20.0,
                bottom: 10.0,
              ),
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
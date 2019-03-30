import 'package:flutter/material.dart';
import '../common/panel.dart';
import '../common/one_image.dart';
import '../common/footer.dart';
import '../model/ins.dart';
import './img_items.dart';
import './in.dart';
import './rslider.dart';
class RaisePage extends StatefulWidget {

  @override
  _RaisePageState createState() => _RaisePageState();
}

class _RaisePageState extends State<RaisePage> {

  List<String> imgs1 = ['http://img12.360buyimg.com/jrpmobile/jfs/t3184/283/6032981290/37056/fa30c674/589bd5a2Nabdbbbd9.jpg?width=376&height=160',
  'http://img12.360buyimg.com/jrpmobile/jfs/t3298/196/6130416421/33755/a0536d3e/589bd5d4Nf32e7adc.jpg?width=374&height=160'];

   List<String> imgs2 = ['http://img12.360buyimg.com/jrpmobile/jfs/t7456/56/1425209238/21928/f1fe492d/599cee57Naea99020.jpg?width=250&height=330',
  'http://img12.360buyimg.com/jrpmobile/jfs/t7894/126/1440046618/24763/5ce6a129/599cee04Ne77b3641.jpg?width=250&height=330',
  'http://img12.360buyimg.com/jrpmobile/jfs/t6385/103/1675552688/24265/91be4150/59549aedNa30670f7.jpg?width=250&height=330'];


  List<Ins> list1 = [Ins('https://img30.360buyimg.com/cf/s250x250_jfs/t14881/283/656508232/143980/9b606acf/5a33a171N18c9c80a.jpg', '双响炮蓝牙音箱', '29.00', 172),
  Ins('https://img30.360buyimg.com/cf/s250x250_jfs/t15529/308/632300625/135123/adb9c6d0/5a37676dNc31da9ea.jpg', '脑波相机', '998.00', 82)];

  List<Ins> list2 = [Ins('https://img30.360buyimg.com/cf/s250x250_jfs/t11257/287/2281727659/55759/e00b90a/5a138f21N32dca834.jpg', '智能电动牙刷', '19.00', 481),
  Ins('https://img30.360buyimg.com/cf/s250x250_jfs/t14209/293/662014092/61635/bba5c330/5a33a983N077cac56.jpg', '烟草加热电子烟', '258.00', 105)];

  List<Ins> list3 = [Ins('https://img30.360buyimg.com/cf/s250x250_jfs/t14197/160/546457496/134173/4e1baccd/5a30ccc5Na44f7492.jpg', '泗洪花雕醉蟹', '58.00', 222),
  Ins('https://img30.360buyimg.com/cf/s250x250_jfs/t15007/47/884045069/149879/17987250/5a3cb182N15868ea1.jpg', '赖公高淮封藏老酒', '99.00', 199)];

  List<String> rlist = ['签到领流量，1元500M！','百万白条券免费送，速来领取！！ '];
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
              Row(
                children: <Widget>[
                  Image.network('http://m.jr.jd.com/spe/qyy/main/images/scroll_title_img.png',width: 72,height: 36,),
                  Expanded(
                    child: Rslider(
                      list: rlist,
                    ),
                  )
                ],
              ),
              Panel(
                title: '每日签到',
                more: '不抢白不抢',
              ),
              ImageItems(
                items: imgs1,
              ),
              Panel(
                title: 'In货推荐',
              ),
               OneImage(
                img: 'http://img12.360buyimg.com/jrpmobile/jfs/t3406/210/2247820735/50952/86016eea/5846d8e7N20446dbd.png?width=750&height=200',
                height: screenWidth*85/320,
              ),
             
              Panel(
                title: '理财精选'
              ),
              In(
                list: list1,
              ),
              OneImage(
                img: 'http://img12.360buyimg.com/jrpmobile/jfs/t3739/82/2244582797/54399/746c7d79/5846a953N66b67d05.png?width=750&height=200',
                height: screenWidth*85/320,
                marginTop: 10.0,
              ),
              In(
                list: list2,
              ),
              OneImage(
                img: 'http://img12.360buyimg.com/jrpmobile/jfs/t3214/113/4408032436/61548/ce316eef/5846d310Ne93f00c9.png?width=750&height=200',
                height: screenWidth*85/320,
                marginTop: 10.0,
              ),
              In(
                list: list3,
              ),
              Panel(
                title: '更多福利',
                more: '专享福利',
              ),
              ImageItems(
                items: imgs2,
                bottom: 30.0,
              ),
              Footer()
            ],
          ),
        ),
    );
  
  }
}
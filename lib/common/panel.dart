import 'package:flutter/material.dart';

class Panel extends StatelessWidget {
  Panel({Key key, this.title, this.more = ''}) : super(key: key);

  final String title;
  final String more;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16.0, 16.0, 14.0, 16.0),
      margin: EdgeInsets.fromLTRB(0, 10.0, 0, 0),
      color: Colors.white,
      // Center可以撑满整个Container
      // Align也可以撑满
      child: Stack(
        // alignment: AlignmentDirectional.center,
        children: <Widget>[
          Align(
            alignment: FractionalOffset.center,
            child: Text(
              '- $title -',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
            ),
          ),
          _buildMore(),
        ],
      ),
    );
  }

  Widget _buildMore() {
    return more != '' ? Align(
      alignment: FractionalOffset.centerRight,
      child: Text(
        '$more >',
        style: TextStyle(fontSize: 14.0, color: Color(0xff999999)),
      ),
    ) : Container(height:0.0,width:0.0);
  }
}
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class GraphSreen extends StatefulWidget {
  static const routeName = '/graph';
  @override
  _GraphSreenState createState() => _GraphSreenState();
}

class _GraphSreenState extends State<GraphSreen> {
  
  double screen;
  bool statusRedEye = true;
  @override
  Widget build(BuildContext context) {
     screen = MediaQuery.of(context).size.width;
    return Container(
      
    );
  }
}
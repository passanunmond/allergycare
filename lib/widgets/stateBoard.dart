import 'package:flutter/material.dart';

class StateBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.only(top: 50),
      child: Container(
              child: Container(
                child: Row(
                  children: [
                    Container(
                        margin: EdgeInsets.fromLTRB(26, 0, 0, 10),
                        height: 100,
                        // padding: EdgeInsets.all(15),
                        child: Image.asset('assets/images/sad.png',
                            fit: BoxFit.cover)),
                    Container(
                      margin: EdgeInsets.fromLTRB(55, 0, 0, 0),
                      child: Column(
                        children: [
                          SizedBox(height: 13,),
                          Container(
                            child: Text(
                              'อาการระดับ',
                              style: TextStyle(
                                 fontWeight: FontWeight.bold,
                                fontSize:28,
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Container(
                            child: Text(
                              'ปานกลาง',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 28,
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
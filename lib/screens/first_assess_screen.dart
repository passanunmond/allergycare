import 'package:flutter/material.dart';
import 'package:tuallergycare/screens/assess_screen.dart';
import 'package:tuallergycare/utility/style.dart';

class FirstAssessScreen extends StatefulWidget {
  static const routeName = '/firstassess';
  @override
  _FirstAssessScreenState createState() => _FirstAssessScreenState();
}

class _FirstAssessScreenState extends State<FirstAssessScreen> {
  
  double screen;
  bool statusRedEye = true;

  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;

    Container buildstart() {
      return Container(
        margin: EdgeInsets.only(top: 16),
        width: screen * 0.25,
        child: ElevatedButton(
          onPressed: () => Navigator.of(context).pushNamed(AssessScreen.routeName,),
          child: Text('เริ่มทำ'),
          style: ElevatedButton.styleFrom(
            primary: Style().darkColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Style().white),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/images/assessment.png'),
                Style().titleH1('แบบประเมิน',
                ),
                Container(
                  child: Style().titleH3(
                      'แบบประเมินเกี่ยวกับอาการของผู้ป่วย\nโรคภูมิแพ้จมูกอักเสบ 7 วันย้อนหลัง'),
                  ),
                buildstart(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

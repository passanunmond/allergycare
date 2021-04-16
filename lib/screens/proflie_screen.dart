import 'package:flutter/material.dart';
import 'package:tuallergycare/utility/style.dart';
import 'package:tuallergycare/widgets/info_card.dart';

const sex1 = "เพศ";
const sex2 = "ผู้ชาย";
const birthday1 = "วันเกิด";
const birthday2 = "27 เมษายน 2540";
const w1 = "น้ำหนัก";
const w2 = "70 กิโลกรัม";
const h1 = "ส่วนสูง";
const h2 = "180 เซนติเมตร";
const disease1 = "โรค";
const disease2 = "ภูมิแพ้จมูกอักเสบ";
const drug1 = "ยา";
const drug2 = "Budesonide\nLoratadine";
const skintest1 = "skintest";
const skintest2 = "German cockroaches\nRagweed";
const research1 = "ผลวินิจฉัย";
const research2 = "อาการแย่ลง";
const appointment1 = "ตารางนัด";
const appointment2 =
    "แพทย์หญิง สุดสวย\nวันที่ 02/09/2563\nคลินิคภูมิแพ้\nร.พ.ธรรมศาสตร์\nตึก A ชั้น 2";

class ProfileScreen extends StatefulWidget {
  static const routeName = '/profile';
  @override
  _ProfilescreenState createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              CustomPaint(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                ),
                painter: HeaderContainer(),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Text(
                      "โปรไฟล์",
                      style: TextStyle(
                          fontSize: 20,
                          letterSpacing: 1,
                          color: Color(0xffffffff),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.fromLTRB(0, 2, 0, 10),
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 5),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/patient.png'),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "ธีรดนย์ ศุภพันธุ์ภิญโญ",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                      child: SingleChildScrollView(
                    child: Column(
                      children: [
                        InfoCard(
                            text1: sex1, text2: sex2, onPressed: () async {}),
                        InfoCard(
                            text1: birthday1,
                            text2: birthday2,
                            onPressed: () async {}),
                        InfoCard(text1: w1, text2: w2, onPressed: () async {}),
                        InfoCard(text1: h1, text2: h2, onPressed: () async {}),
                        InfoCard(
                            text1: disease1,
                            text2: disease2,
                            onPressed: () async {}),
                        InfoCard(
                            text1: drug1, text2: drug2, onPressed: () async {}),
                        InfoCard(
                            text1: skintest1,
                            text2: skintest2,
                            onPressed: () async {}),
                        InfoCard(
                            text1: research1,
                            text2: research2,
                            onPressed: () async {}),
                        InfoCard(
                            text1: appointment1,
                            text2: appointment2,
                            onPressed: () async {}),
                      ],
                    ),
                  ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HeaderContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Color(0xff006f69);
    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 2, 225, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

import 'package:flutter/material.dart';
import 'package:tuallergycare/screens/auth_screen.dart';
import 'package:tuallergycare/utility/style.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/register';
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool statusRedEye = true;
  double screen, screen2;

  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;

    TextButton backAuth() => TextButton(
        onPressed: () => Navigator.of(context).pushNamed(
              AuthScreen.routeName,
            ),
        child: Text(
          'เข้าสู่ระบบ',
          style: TextStyle(color: Style().darkColor),
        ));

    Container buildName() {
      return Container(
        margin: EdgeInsets.only(top: 16),
        width: screen * 0.4,
        child: TextField(
          style: TextStyle(color: Style().darkColor),
          decoration: InputDecoration(
            hintStyle: TextStyle(color: Style().darkColor),
            hintText: 'ชื่อ',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Style().darkColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Style().lightColor),
            ),
          ),
        ),
      );
    }

    Container buildSurname() {
      return Container(
        //decoration: BoxDecoration(color: Style().white),
        margin: EdgeInsets.only(top: 16),
        width: screen * 0.4,
        child: TextField(
          style: TextStyle(color: Style().darkColor),
          decoration: InputDecoration(
            hintStyle: TextStyle(color: Style().darkColor),
            hintText: 'นามสกุล',
            // prefixIcon: Icon(
            //   Icons.perm_identity,
            //   color: Style().darkColor,
            //  ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Style().darkColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Style().lightColor),
            ),
          ),
        ),
      );
    }

    Container buildEmail() {
      return Container(
        // decoration: BoxDecoration(color: Style().white),
        margin: EdgeInsets.only(top: 16),
        width: screen * 0.85,
        child: TextField(
          style: TextStyle(color: Style().darkColor),
          decoration: InputDecoration(
            hintStyle: TextStyle(color: Style().darkColor),
            hintText: 'อีเมล',
            // prefixIcon: Icon(Icons.perm_identity, color: Style().darkColor),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Style().darkColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Style().lightColor),
            ),
          ),
        ),
      );
    }

    Container buildBD() {
      return Container(
        // decoration: BoxDecoration(color: Style().white),
        margin: EdgeInsets.only(top: 16),
        width: screen * 0.85,
        child: TextField(
          style: TextStyle(color: Style().darkColor),
          decoration: InputDecoration(
            hintStyle: TextStyle(color: Style().darkColor),
            hintText: 'วันเกิด',
            // prefixIcon: Icon(Icons.perm_identity, color: Style().darkColor),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Style().darkColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Style().lightColor),
            ),
          ),
        ),
      );
    }

    Container buildW() {
      return Container(
        // decoration: BoxDecoration(color: Style().white),
        margin: EdgeInsets.only(top: 16),
        width: screen * 0.75,
        child: TextField(
          style: TextStyle(color: Style().darkColor),
          decoration: InputDecoration(
            hintStyle: TextStyle(color: Style().darkColor),
            hintText: 'น้ำหนัก',
            // prefixIcon: Icon(Icons.perm_identity, color: Style().darkColor),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Style().darkColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Style().lightColor),
            ),
          ),
        ),
      );
    }

    Container buildH() {
      return Container(
        // decoration: BoxDecoration(color: Style().white),
        margin: EdgeInsets.only(top: 16),
        width: screen * 0.75,
        child: TextField(
          style: TextStyle(color: Style().darkColor),
          decoration: InputDecoration(
            hintStyle: TextStyle(color: Style().darkColor),
            hintText: 'ส่วนสูง',
            // prefixIcon: Icon(Icons.perm_identity, color: Style().darkColor),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Style().darkColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Style().lightColor),
            ),
          ),
        ),
      );
    }

    Container buildnewRegister() {
      return Container(
        margin: EdgeInsets.only(top: 16),
        width: screen * 0.75,
        child: ElevatedButton(
          onPressed: () => Navigator.of(context).pushNamed(
            AuthScreen.routeName,
          ),
          child: Text('ลงทะเบียน'),
          style: ElevatedButton.styleFrom(
            primary: Style().darkColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      );
    }



    //screen = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: backAuth(),
      appBar: AppBar(
        backgroundColor: Style().darkColor,
        title: Text('ลงทะเบียน'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 17, 0),
                child: buildName(),
              ),
              buildSurname(),
            ],
          ),

          buildEmail(),
          buildBD(),


          // buildW(),
          // buildH(),
          // buildnewRegister()
        ],
      ),
    );
  }
}

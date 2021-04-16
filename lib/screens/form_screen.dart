import 'package:flutter/material.dart';
import 'package:tuallergycare/screens/auth_screen.dart';
import 'package:tuallergycare/utility/style.dart';
import 'package:tuallergycare/widgets/radio_button.dart';



class FormScreen extends StatefulWidget {
  static const routeName = '/formscreen';
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  String _name;
  String _email;
  String _password;
  String _url;
  String _phoneNumber;
  String _sex;
  String _calories;
  String _bd;


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'ชื่อ-นามสกุล',
      ),
      //maxLength: 50,

      validator: (String value) {
        if (value.isEmpty) {
          return 'กรุณากรอกชื่อ-นามสกุล';
        }
        return null;
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'อีเมล'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'กรุณากรอกอีเมล';
        }
        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email Address';
        }
        return null;
      },
      onSaved: (String value) {
        _email = value;
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'รหัสผ่าน'),
      keyboardType: TextInputType.visiblePassword,
      validator: (String value) {
        if (value.isEmpty) {
          return 'กรุณากรอกรหัสผ่าน';
        }

        return null;
      },
      onSaved: (String value) {
        _password = value;
      },
    );
  }

  // Widget _builURL() {
  //   return TextFormField(
  //     decoration: InputDecoration(labelText: 'Url'),
  //     keyboardType: TextInputType.url,
  //     validator: (String value) {
  //       if (value.isEmpty) {
  //         return 'URL is Required';
  //       }

  //       return null;
  //     },
  //     onSaved: (String value) {
  //       _url = value;
  //     },
  //   );
  // }

  Widget _buildPhoneNumber() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'เบอร์โทรศัพท์'),
      maxLength: 10,
      keyboardType: TextInputType.phone,
      validator: (String value) {
        if (value.isEmpty) {
          return 'กรุณากรอกเบอร์โทรศัพท์';
        }
        return null;
      },
      onSaved: (String value) {
        _url = value;
      },
    );
  }

  // Widget _buildCalories() {
  //   return TextFormField(
  //     decoration: InputDecoration(labelText: 'Calories'),
  //     keyboardType: TextInputType.number,
  //     validator: (String value) {
  //       int calories = int.tryParse(value);

  //       if (calories == null || calories <= 0) {
  //         return 'Calories must be greater than 0';
  //      }

  //       return null;
  //     },
  //     onSaved: (String value) {
  //       _calories = value;
  //     },
  //   );
  // }

  Widget _buildLogin() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      //width: screen * 0.75,
      child: ElevatedButton(
        onPressed: () {
          if (!_formKey.currentState.validate()) {
            return;
          }
          _formKey.currentState.save();

          // print(_name);
          // print(_email);
          // print(_phoneNumber);
          // print(_url);
          // print(_password);
          // print(_calories);
          //Send to API
        },
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

  Widget _buildsex() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 16),
      child: Text(
        'เพศ',
        textAlign: TextAlign.left,
        style: TextStyle(
          color: Style().darkColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ลงทะเบียน")),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildName(),
                _buildEmail(),
                _buildPhoneNumber(),
                //DatePickerWidget(),
               // _buildsex(),
                RadioButtonGroupWidget(),
                _buildPassword(),
               _buildLogin(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

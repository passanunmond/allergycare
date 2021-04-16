import 'package:flutter/material.dart';
import 'package:tuallergycare/utility/style.dart';

class DoctorFormScreen extends StatefulWidget {
  static const routeName = '/doctorformscreen';
  @override
  State<StatefulWidget> createState() {
    return DoctorFormScreenState();
  }
}

class DoctorFormScreenState extends State<DoctorFormScreen> {
  String _namedoc;
  String _emaildoc;
  String _passworddoc;
  String _phoneNumberdoc;
  String _urldoc;
  String _chosenValue;

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
        _namedoc = value;
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
        _emaildoc = value;
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
        _passworddoc = value;
      },
    );
  }

  Widget _buildLicensenumber() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'เลขที่ใบอนุญาต'),
      //maxLength: 10,
      keyboardType: TextInputType.number,
      validator: (String value) {
        if (value.isEmpty) {
          return 'กรุณากรอกเลขที่ใบอนุญาต';
        }
        return null;
      },
      onSaved: (String value) {
        _urldoc = value;
      },
    );
  }

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

  Widget _buildspecialty() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 16),
      child: DropdownButton<String>(
        value: _chosenValue,
        elevation: 3,
        style: TextStyle(color: Style().darkColor),
        items: <String>[
          'กุมารแพทย์',
          'กุมารแพทย์เชี่ยวชาญโรคปอด',
          'กุมารแพทย์เชี่ยวชาญโรคภูมิแพ้',
          'แพทย์ทั่วไป',
          'แพทย์หูคอจมูก',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        hint: Text(
          "กรุณาเลือกสาขาแพทย์ที่เชี่ยวชาญ",
          style: TextStyle(color: Colors.black54, fontSize: 16),
        ),
        onChanged: (String value) {
          setState(() {
            _chosenValue = value;
          });
        },
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
                _buildLicensenumber(),
                _buildspecialty(),
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

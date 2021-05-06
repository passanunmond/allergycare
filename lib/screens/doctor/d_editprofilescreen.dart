import 'package:flutter/material.dart';

class DoctorEditProfileScreen extends StatefulWidget {
  static final routeName = '/doctor_edit_profile';
  @override
  _DoctorEditProfileScreenState createState() =>
      _DoctorEditProfileScreenState();
}

class _DoctorEditProfileScreenState extends State<DoctorEditProfileScreen> {
  String _nameDoctor;
  String _genderDoctor;
  String _phoneNumberdoc;
  String _emailDoctor;
  String _licenseNumber;
  String _specialty;
  var _isInit = true;
  @override
  void initState() {
    super.initState();
  }

  // @override
  // void didChangeDependencies() {
  //   if (_isInit) {
  //     final args = ModalRoute.of(context).settings.arguments
  //         as ArgumentsDoctorEditProfileScreen;
  //     _nameDoctor = args.name;
  //     _emailDoctor = args.email;
  //     _licenseNumber = args.license;
  //     _specialty = args.special;
  //     _phoneNumberdoc = args.phoneNumber;
  //     _genderDoctor = args.gender;
  //   }
  //   _isInit = false;
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('แก้ไขโปรไฟล์'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Form(
            //key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  initialValue: _nameDoctor,
                  decoration: InputDecoration(
                    labelText: 'ชื่อ-นามสกุล',
                  ),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'กรุณากรอกชื่อ-นามสกุล';
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    _nameDoctor = value;
                  },
                ),
                TextFormField(
                  initialValue: _genderDoctor,
                  decoration: InputDecoration(
                    labelText: 'เพศ',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'กรุณากรอกเพศ';
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    _genderDoctor = value;
                  },
                ),
                TextFormField(
                  initialValue: _emailDoctor,
                  decoration: InputDecoration(labelText: 'อีเมล'),
                  keyboardType: TextInputType.phone,
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
                    _emailDoctor = value;
                  },
                ),
                TextFormField(
                  initialValue: _phoneNumberdoc,
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
                    _phoneNumberdoc = value;
                  },
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: ElevatedButton(
                    onPressed: () async {
                      // if (!_formKey.currentState.validate()) {
                      //   return;
                      // }
                      // _formKey.currentState.save();

                      // await FirebaseFirestore.instance
                      //     .collection('patients')
                      //     .doc(currentDoctor.uid)
                      //     .update({
                      //   'username': _nameDoctor,
                      //   'gender': _genderDoctor,
                      //   'phone_number': _phoneNumberdoc,
                      //   'email' : _emailDoctor,
                      // });
                      // Navigator.pop(context);
                    },
                    child: Text(
                      'บันทึก',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

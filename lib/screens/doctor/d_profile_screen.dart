import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
//import 'package:image_picker/image_picker.dart';
import 'package:tuallergycare/screens/doctor/d_editprofilescreen.dart';
import 'package:tuallergycare/utility/style.dart';

const _nameDoctor = "สมชาย ดีใจ";
const _genderDoctor = "ผู้ชาย";
const _emailDoctor = "doctor_som@gmail.com";
const _phoneNumberdoc = "0989982348";
const _licenseNumber = "4444444444444";
const _specialty = "กุมารแพทย์เชี่ยวชาญโรคภูมิแพ้";

class DoctorProfileScreen extends StatefulWidget {
  static const routeName = '/doctorProfilescreen';
  @override
  DoctorProfileScreenState createState() => DoctorProfileScreenState();
}

enum Profile { doctor }

class DoctorProfileScreenState extends State<DoctorProfileScreen> {
  //final currentPatient = FirebaseAuth.instance.currentUser;
  // File _patientImage;
  // final _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
  }

//  Future<void> setImage() async {
    // final ref = FirebaseStorage.instance
    //     .ref()
    //     .child('user_image')
    //     .child(currentPatient.uid + '.jpg');

    // // await ref.putFile(patientImage);

    // final url = await ref.getDownloadURL();

  //   try {
  //     final patientImage = await _picker.getImage(
  //       source: ImageSource.camera,
  //       imageQuality: 50,
  //       maxWidth: 150,
  //     );
  //     setState(() {
  //       if (patientImage != null) {
  //         _patientImage = File(patientImage.path);
  //       }
  //     });
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  Widget buildInfoDoctor(String nameTag, infoPatient) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              child: Text(
                nameTag,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: infoPatient != null
                    ? Text(
                        infoPatient,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 18,
                        ),
                      )
                    : Text(
                        'กดปุ่ม\'แก้ไข\'เพื่อเพิ่มข้อมูล',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text("โปรไฟล์"),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.pushNamed(context, DoctorEditProfileScreen.routeName);
              // arguments: ArgumentsDoctorEditProfileScreen(
              //   _nameDoctor,
              //   _genderDoctor,
              //   _phoneNumberdoc,
              //   _emailDoctor,
              //   _licenseNumber,
              //   _specialty)
              //  );
            },
          ),
        ],
      ),
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
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.fromLTRB(0, 2, 0, 10),
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.width / 2,
                  //   decoration: _patientImage != null
                  //       ? BoxDecoration(
                  //           border: Border.all(color: Colors.white, width: 5),
                  //           shape: BoxShape.circle,
                  //           image: DecorationImage(
                  //             fit: BoxFit.cover,
                  //             image: FileImage(_patientImage),
                  //           ),
                  //         )
                  //       : BoxDecoration(
                  //           border: Border.all(color: Colors.white, width: 5),
                  //           shape: BoxShape.circle,
                  //           image: DecorationImage(
                  //             fit: BoxFit.cover,
                  //             image: _genderDoctor == 'ชาย'
                  //                 ? AssetImage('assets/images/avamys.png')
                  //                 : AssetImage('assets/images/sad.png'),
                  //           ),
                  //         ),
                  // ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 5),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/patient.png'),
                    ),
                  ),
                   ),
                  TextButton.icon(
                    onPressed: () {},
                    //   setImage,
                    icon: Icon(
                      Icons.image,
                      color: Theme.of(context).primaryColor,
                    ),
                    label: Text(
                      'Add Image',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      _nameDoctor,
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            buildInfoDoctor('เพศ', _genderDoctor),
                            buildInfoDoctor('อีเมล', _emailDoctor),
                            buildInfoDoctor('โทรศัพท์', _phoneNumberdoc),
                            buildInfoDoctor('เลขที่ใบอนุญาต', _licenseNumber),
                            buildInfoDoctor('ความเชี่ยวชาญ', _specialty),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
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
    Paint paint = Paint()..color = Color.fromRGBO(59, 155, 149, 1);
    Path path = Path()
      ..relativeLineTo(0, 100)
      ..quadraticBezierTo(size.width / 2, 180, size.width, 100)
      ..relativeLineTo(0, -100)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

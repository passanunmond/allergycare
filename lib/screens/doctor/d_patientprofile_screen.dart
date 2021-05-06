import 'package:flutter/material.dart';
import 'package:tuallergycare/screens/doctor/d_adddrug_screen.dart';
import 'package:tuallergycare/screens/doctor/d_appointment.dart';
import 'package:tuallergycare/screens/doctor/d_diagnose.dart';
import 'package:tuallergycare/screens/doctor/d_skintest.dart';
import 'package:tuallergycare/utility/style.dart';

const _namePatient = "สมชาย ดีใจ";
const _birthdayPatient = "27 เมษายน 2540";
const _genderPatient = "ผู้ชาย";
const _phoneNumberPatient = "0989982348";
const _height = "160 เซนติเมตร";
const _weight = "45 กิโลกรัม";
const _disease = "ภุมิแพ้จมูกอักเสบ";
const _medicine = "Avamys\nZyrtec";
const _skintest = "Acaia\nAmerican cockroaches";
const _research = "อาการแย่ลง";
const _appointment = "11 มิถุนายน 2564\nเวลา09.00-10.00น.";

class PatientProfileScreen extends StatefulWidget {
  static const routeName = '/patientprofilescreen';
  @override
  _PatientProfileScreenState createState() => _PatientProfileScreenState();
}

class _PatientProfileScreenState extends State<PatientProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('รายละเอียดผู้ป่วย'),
          bottom: TabBar(
            //isScrollable: true,
            indicatorColor: Colors.white,
            indicatorWeight: 5,
            tabs: [
              Tab(text: 'ข้อมูล'),
              Tab(text: 'แบบประเมิน'),
              Tab(text: 'กราฟ'),
            ],
          ),
          elevation: 10,
          titleSpacing: 10,
        ),
        body: TabBarView(
          children: [
            PatientInfo(),
            PatientFirstAssessment(),
            PatientGraph(),
          ],
        ),
      ),
    );
  }
}

//ข้อมูล
class PatientInfo extends StatefulWidget {
  @override
  _PatientInfoState createState() => _PatientInfoState();
}

class _PatientInfoState extends State<PatientInfo> {
  @override
  void initState() {
    super.initState();
  }

  Widget buildInfoPatient(String nameTag, infoPatient) {
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
                          fontSize: 18,
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }

//แก้ไขยา
  Widget buildInfoPatientEditDrug() {
    return Container(
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              child: Text(
                "ยา",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Text(
                          "ชื่อยา",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 18,
                          ),
                        ),
                          IconButton(
                            icon: const Icon(
                              Icons.edit,
                              size: 18,
                              color: Colors.grey,
                            ),
                           
                              onPressed: () => Navigator.of(context).pushNamed(AddDrugScreen.routeName,),
                            
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //แก้ไขskintest
   Widget buildInfoPatientEditSkintest() {
    return Container(
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              child: Text(
                "skintest",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Text(
                          "Acaia\nDog",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 18,
                          ),
                        ),
                          IconButton(
                            icon: const Icon(
                              Icons.edit,
                              size: 18,
                              color: Colors.grey,
                            ),
                           onPressed: () => Navigator.of(context).pushNamed(AddSkinTestScreen.routeName,),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //แก้ไขนัดหมายผู้ป่วย
  Widget buildInfoPatientEditAppointment() {
    return Container(
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              child: Text(
                "ใบนัด",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  
                  child: Padding(
                    //padding: const EdgeInsets.all(12.0),
                    padding: const EdgeInsets.only(left: 12.0,top:12.0, bottom: 12.0),
                    child: Row(
                      children: [
                        Text(
                          "11 มิถุนายน 2564\nเวลา09.00-10.00น",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 18,
                          ),
                        ),
                          IconButton(
                            icon: const Icon(
                              Icons.edit,
                              size: 18,
                              color: Colors.grey,
                            ),
                            onPressed: () => Navigator.of(context).pushNamed(Appointment.routeName,),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

//แก้ไขผลวินิจฉัย
 Widget buildInfoPatientEditReseach() {
    return Container(
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              child: Text(
                "ผลวินิจฉัย",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Text(
                          "อาการดีขึ้น",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 18,
                          ),
                        ),
                          IconButton(
                            icon: const Icon(
                              Icons.edit, 
                              size: 18,
                              color: Colors.grey,
                            ),
                            onPressed: () => Navigator.of(context).pushNamed(Diagnose.routeName,),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
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
                      _namePatient,
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
                            buildInfoPatient('เพศ', _genderPatient),
                            buildInfoPatient('วันเกิด', _birthdayPatient),
                            buildInfoPatient(
                                'เบอร์โทรศัพท์', _phoneNumberPatient),
                            buildInfoPatient('น้ำหนัก', _weight),
                            buildInfoPatient('ส่วนสูง', _height),
                            buildInfoPatient('โรค', _disease),
                            buildInfoPatientEditDrug(),
                            buildInfoPatientEditSkintest(),
                            buildInfoPatientEditReseach(),
                            buildInfoPatientEditAppointment(),
                            // buildInfoPatientEdit(
                            //   'ยา',
                            //   _medicine,
                            // ),
                            // buildInfoPatientEdit('skintest', _skintest),
                            // buildInfoPatientEdit('ผลวินิจฉัย', _research),
                            // buildInfoPatientEdit('ตารางนัด', _appointment)
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

//แบบประเมินผู้ป่วยครั้งแรก
class PatientFirstAssessment extends StatefulWidget {
  @override
  _PatientFirstAssessmentState createState() => _PatientFirstAssessmentState();
}

class _PatientFirstAssessmentState extends State<PatientFirstAssessment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

//กราฟผู้ป่วย
class PatientGraph extends StatefulWidget {
  @override
  _PatientGraphState createState() => _PatientGraphState();
}

class _PatientGraphState extends State<PatientGraph> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

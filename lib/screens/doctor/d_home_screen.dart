import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tuallergycare/screens/doctor/d_patientprofile_screen.dart';
import 'package:tuallergycare/utility/style.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class DoctorHomeScreen extends StatefulWidget {
  static const routeName = '/doctorhomescreen';
  @override
  State<StatefulWidget> createState() {
    return DoctorHomeScreenState();
  }
}

class DoctorHomeScreenState extends State<DoctorHomeScreen> {
  String qrCode = 'Unknown';
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('หน้าหลัก'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.person_add_alt_rounded),
              tooltip: 'Scan QR Code',
              onPressed: () => {},
            ),
          ],
          bottom: TabBar(
            //isScrollable: true,
            indicatorColor: Colors.white,
            indicatorWeight: 5,
            tabs: [
              Tab(text: 'รายชื่อผู้ป่วยที่นัดวันนี้'),
              Tab(text: 'รายชื่อผู้ป่วยทั้งหมด'),
            ],
          ),
          elevation: 10,
          titleSpacing: 10,
        ),
        body: TabBarView(
          children: [
            PatientToday(),
            PatientAll(),
          ],
        ),
      ),
    ); 

     Future<void> scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );

      if (!mounted) return;

      setState(() {
        this.qrCode = qrCode;
      });
    } on PlatformException {
      qrCode = 'Failed to get platform version.';
    }
  } 
  }
}

//รายชื่อผู้ป่วยที่นัดวันนี้
class PatientToday extends StatefulWidget {
  @override
  _PatientTodayState createState() => _PatientTodayState();
}

class _PatientTodayState extends State<PatientToday> {
  CalendarController _calendar;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _calendar = CalendarController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _calendar.dispose();
    super.dispose();
  }

  @override
  void selectPatient(BuildContext context) {
    Navigator.of(context).pushNamed(
      PatientProfileScreen.routeName,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          //ปฏิทิน
          TableCalendar(
            calendarController: _calendar,
            initialCalendarFormat: CalendarFormat.week,
            startingDayOfWeek: StartingDayOfWeek.sunday,
            formatAnimation: FormatAnimation.slide,
            headerStyle: HeaderStyle(
              centerHeaderTitle: true,
              formatButtonVisible: false,
              titleTextStyle: TextStyle(color: Style().darkColor, fontSize: 16),
              leftChevronIcon: Icon(
                Icons.arrow_back_ios,
                color: Style().darkColor,
                size: 15,
              ),
              rightChevronIcon: Icon(
                Icons.arrow_forward_ios,
                color: Style().darkColor,
                size: 15,
              ),
              leftChevronMargin: EdgeInsets.only(left: 70),
              rightChevronMargin: EdgeInsets.only(right: 70),
            ),
            calendarStyle: CalendarStyle(
                weekendStyle: TextStyle(color: Colors.black),
                weekdayStyle: TextStyle(color: Colors.black)),
            daysOfWeekStyle: DaysOfWeekStyle(
                weekendStyle: TextStyle(color: Style().darkColor),
                weekdayStyle: TextStyle(color: Style().darkColor)),
          ),
          //ผู้ป่วย
          Container(
            padding: EdgeInsets.only(right: 15.0),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 100,
            child: GridView.count(
              crossAxisCount: 2,
              primary: false,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 5.0,
              childAspectRatio: 1.0,
              children: <Widget>[
                _buildCard(
                    'สมจิต สมใจ',
                    '09.00-10.00 น',
                    'assets/images/pone.png',
                    'ปานกลาง',
                    'assets/images/status_yellow.png',
                    context),
                _buildCard(
                    'สมหมาย ดั่งใจ',
                    '10.00-11.00 น',
                    'assets/images/ptwo.png',
                    'น้อย',
                    'assets/images/status_green.png',
                    context),
                _buildCard(
                    'สมศรี ยิ้มสยาม',
                    '11.00-12.00 น',
                    'assets/images/ptree.png',
                    'ค่อนข้างรุนแรง',
                    'assets/images/status_orange.png',
                    context),
                _buildCard(
                    'สมหญิง ชอบสมชาย',
                    '09.00-10.00 น',
                    'assets/images/pfour.png',
                    'รุนแรงที่สุด',
                    'assets/images/status_red.png',
                    context),
                _buildCard(
                    'สมชาย รักสมฤดี',
                    '14.00-15.00 น',
                    'assets/images/pfive.png',
                    'น้อย',
                    'assets/images/status_green.png',
                    context)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(String name, String time, String imgPath, String status,
      String statusicon, context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 15.0, right: 5.0),
      child: InkWell(
        // onTap: () {},
        onTap: () => selectPatient(context),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 3.0,
                    blurRadius: 5.0)
              ],
              color: Colors.white),
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Hero(
                    tag: imgPath,
                    child: Stack(children: [
                      Container(
                        height: 75,
                        width: 75,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(imgPath), fit: BoxFit.contain),
                        ),
                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(
                                    statusicon,
                                  ),
                                  fit: BoxFit.contain
                                  // fit: BoxFit.contain
                                  ),
                            ),
                            // decoration: BoxDecoration(
                            //   //shape: BoxShape.circle,
                            //   border: Border.all(
                            //     width: 4,
                            //     color: Theme.of(context).scaffoldBackgroundColor,
                            //   ),
                            // ),
                            // child: Icon(
                            //   Icons.circle,
                            //   size: 30,
                            //   color: Colors.green,
                            // ),
                            //
                          )),
                    ]),
                  ),
                ),
              ),
              SizedBox(
                height: 7.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Container(
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.person, color: Colors.grey),
                      Padding(
                        padding: EdgeInsets.only(left: 5.0),
                        child: Text(name,
                            style:
                                TextStyle(color: Colors.black, fontSize: 14.0)),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Container(
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.timer, color: Colors.grey),
                      Padding(
                        padding: EdgeInsets.only(left: 5.0),
                        child: Text(time,
                            style:
                                TextStyle(color: Colors.black, fontSize: 14.0)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  selectStimulus(context) {}
}

//รายชื่อผู้ป่วยทั้งหมด
class PatientAll extends StatefulWidget {
  @override
  _PatientAllState createState() => _PatientAllState();
}

class _PatientAllState extends State<PatientAll> {
  CalendarController _calendar;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _calendar = CalendarController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _calendar.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          //ปฏิทิน
          TableCalendar(
            calendarController: _calendar,
            initialCalendarFormat: CalendarFormat.week,
            startingDayOfWeek: StartingDayOfWeek.sunday,
            formatAnimation: FormatAnimation.slide,
            headerStyle: HeaderStyle(
              centerHeaderTitle: true,
              formatButtonVisible: false,
              titleTextStyle: TextStyle(color: Style().darkColor, fontSize: 16),
              leftChevronIcon: Icon(
                Icons.arrow_back_ios,
                color: Style().darkColor,
                size: 15,
              ),
              rightChevronIcon: Icon(
                Icons.arrow_forward_ios,
                color: Style().darkColor,
                size: 15,
              ),
              leftChevronMargin: EdgeInsets.only(left: 70),
              rightChevronMargin: EdgeInsets.only(right: 70),
            ),
            calendarStyle: CalendarStyle(
                weekendStyle: TextStyle(color: Colors.black),
                weekdayStyle: TextStyle(color: Colors.black)),
            daysOfWeekStyle: DaysOfWeekStyle(
                weekendStyle: TextStyle(color: Style().darkColor),
                weekdayStyle: TextStyle(color: Style().darkColor)),
          ),
          //ผู้ป่วย
          Container(
            padding: EdgeInsets.only(right: 15.0),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 100,
            child: GridView.count(
              crossAxisCount: 2,
              primary: false,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 5.0,
              childAspectRatio: 1.0,
              children: <Widget>[
                _buildCard(
                    'สมจิต สมใจ',
                    'เวลา 09.00 น',
                    'assets/images/pone.png',
                    'ปานกลาง',
                    'assets/images/status_yellow.png',
                    context),
                _buildCard(
                    'สมหมาย ดั่งใจ',
                    'เวลา 10.00 น',
                    'assets/images/ptwo.png',
                    'น้อย',
                    'assets/images/status_green.png',
                    context),
                _buildCard(
                    'สมศรี ยิ้มสยาม',
                    'เวลา 11.00 น',
                    'assets/images/ptree.png',
                    'ค่อนข้างรุนแรง',
                    'assets/images/status_orange.png',
                    context),
                _buildCard(
                    'สมหญิง ชอบสมชาย',
                    'เวลา 11.30 น',
                    'assets/images/pfour.png',
                    'รุนแรงที่สุด',
                    'assets/images/status_red.png',
                    context),
                _buildCard(
                    'สมชาย รักสมฤดี',
                    'เวลา 12.00 น',
                    'assets/images/pfive.png',
                    'น้อย',
                    'assets/images/status_green.png',
                    context)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(String name, String time, String imgPath, String status,
      String statusicon, context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 15.0, right: 5.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 3.0,
                    blurRadius: 5.0)
              ],
              color: Colors.white),
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Hero(
                    tag: imgPath,
                    child: Stack(children: [
                      Container(
                        height: 75,
                        width: 75,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(imgPath), fit: BoxFit.contain),
                        ),
                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(
                                    statusicon,
                                  ),
                                  fit: BoxFit.contain
                                  // fit: BoxFit.contain
                                  ),
                            ),
                            // decoration: BoxDecoration(
                            //   //shape: BoxShape.circle,
                            //   border: Border.all(
                            //     width: 4,
                            //     color: Theme.of(context).scaffoldBackgroundColor,
                            //   ),
                            // ),
                            // child: Icon(
                            //   Icons.circle,
                            //   size: 30,
                            //   color: Colors.green,
                            // ),
                            //
                          )),
                    ]),
                  ),
                ),
              ),
              SizedBox(
                height: 7.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Container(
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.person, color: Colors.grey),
                      Padding(
                        padding: EdgeInsets.only(left: 5.0),
                        child: Text(name,
                            style:
                                TextStyle(color: Colors.black, fontSize: 14.0)),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Container(
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.timer, color: Colors.grey),
                      Padding(
                        padding: EdgeInsets.only(left: 5.0),
                        child: Text(time,
                            style:
                                TextStyle(color: Colors.black, fontSize: 14.0)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

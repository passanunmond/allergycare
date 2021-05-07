import 'package:flutter/material.dart';
import 'package:tuallergycare/utility/style.dart';

class Diagnose extends StatefulWidget {
  static const routeName = '/diagnose';
  @override
  _DiagnoseState createState() => _DiagnoseState();
}

class _DiagnoseState extends State<Diagnose> {
  String _selectedstatusPatient;
  List<Map> statusPatient = [
    {"id": '1', "image": "assets/images/status_green.png", "name": "น้อย"},
    {"id": '2', "image": "assets/images/status_yellow.png", "name": "ปานกลาง"},
    {   "id": '3',
      "image": "assets/images/status_orange.png",
      "name": "ค่อนข้างรุนแรง"
    },
    {"id": '4', "image": "assets/images/status_red.png", "name": "รุนแรงที่สุด"}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ผลวินิจฉัย'),
      ),
      body: Container(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'แก้ไขอาการของผู้ป่วย',
                    style: TextStyle(fontSize: 18, color: Style().prinaryColor),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: DropdownButtonHideUnderline(
                          child: ButtonTheme(
                            alignedDropdown: true,
                            child: DropdownButton<String>(
                              isDense: true,
                              // hint: new Text(
                              //   "ชื่อยาสำหรับรับประทาน",
                              //   style: TextStyle(fontSize: 18),
                              // ),
                              value: _selectedstatusPatient,
                              onChanged: (String newValue) {
                                setState(() {
                                  _selectedstatusPatient = newValue;
                                });
                                print(_selectedstatusPatient);
                              },
                              items: statusPatient.map((Map map) {
                                return new DropdownMenuItem<String>(
                                  value: map["name"].toString(),
                                  child: Row(
                                    children: <Widget>[
                                      Image.asset(
                                        map["image"],
                                        fit: BoxFit.contain,
                                        width: 30,
                                        height: 30,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child: Text(
                                          map["name"],
                                          style: TextStyle(
                                            color: Style().darkColor,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ผลวินิจฉัย',
                    style: TextStyle(fontSize: 18, color: Style().prinaryColor),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: TextField(
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    obscureText: false,
                    maxLines: 2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    child: Text(
                      'บันทึก',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Style().prinaryColor,
                    onPressed: () =>  Navigator.of(context).pop(),
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

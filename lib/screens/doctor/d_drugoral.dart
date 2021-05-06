import 'package:flutter/material.dart';
import 'package:tuallergycare/screens/doctor/d_adddrug_screen.dart';
import 'package:tuallergycare/utility/style.dart';

class DrugOral extends StatefulWidget {
  static const routeName = '/drugoral';
  @override
  _DrugOralState createState() => _DrugOralState();
}

class _DrugOralState extends State<DrugOral> {
  String _quantity;
  String _day;
  String _periodtime;
  String _selectedoraldrug;
  List<Map> oraldrug = [
    {"id": '1', "image": "assets/images/zyrtec.png", "name": "Zyrtec®"},
    {"id": '2', "image": "assets/images/allernix.png", "name": "Allernix®"},
    {"id": '3', "image": "assets/images/telfast.png", "name": "Telfast®"},
    {
      "id": '4',
      "image": "assets/images/xyzal.png",
      "name": "Levocetirizine Xyzal®"
    },
    {
      "id": '5',
      "image": "assets/images/aerius.png",
      "name": "Desloratadine Aerius®"
    },
    {
      "id": '6',
      "image": "assets/images/bilaxten.jpeg",
      "name": "Bilastine Bilaxten®"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('เพิ่มการใช้ยา'),
      ),
      body: Container(
        child: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'ข้อมูลยา',
                  style: TextStyle(fontSize: 20, color: Style().prinaryColor),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
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
                            hint: new Text(
                              "ชื่อยาสำหรับรับประทาน",
                              style: TextStyle(fontSize: 18),
                            ),
                            value: _selectedoraldrug,
                            onChanged: (String newValue) {
                              setState(() {
                                _selectedoraldrug = newValue;
                              });
                              print(_selectedoraldrug);
                            },
                            items: oraldrug.map((Map map) {
                              return new DropdownMenuItem<String>(
                                value: map["name"].toString(),
                                child: Row(
                                  children: <Widget>[
                                    Image.asset(
                                      map["image"],
                                      fit: BoxFit.cover,
                                      width: 30,
                                      height: 30,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Text(
                                        map["name"],
                                        style: TextStyle(
                                          color: Style().darkColor,
                                          fontSize: 18,
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
                padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "ปริมาณ",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          //height: 20,
                          width: 65,
                          child: TextFormField(
                            keyboardType: TextInputType.phone,
                            validator: (String value) {
                              // if (value.isEmpty) {
                              //   return 'กรุณา';
                              // }
                              // return null;
                            },
                            onSaved: (String value) {
                              _quantity = value;
                            },
                          ),
                        ),
                        Text(
                          "mg",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "รับประทานครั้งละ",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                            //height: 20,
                            width: 65,
                            child: TextField(
                              keyboardType: TextInputType.number,
                            )),
                        Text(
                          "เม็ด",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "วันละ",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    DropdownButton<String>(
                      value: _day,
                      elevation: 3,
                      style: TextStyle(color: Style().darkColor),
                      items: <String>[
                        '- ',
                        '1 ครั้ง',
                        '2 ครั้ง',
                        '3 ครั้ง',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      hint: Text(
                        "---",
                        style: TextStyle(color: Colors.black54, fontSize: 16),
                      ),
                      onChanged: (String value) {
                        setState(() {
                          _day = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "ช่วงเวลา",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    DropdownButton<String>(
                      value: _periodtime,
                      elevation: 3,
                      style: TextStyle(color: Style().darkColor),
                      items: <String>[
                        'เช้า',
                        'เย็น',
                        'ก่อนนอน',
                        'เมื่อมีอาการ',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      hint: Text(
                        "---",
                        style: TextStyle(color: Colors.black54, fontSize: 16),
                      ),
                      onChanged: (String value) {
                        setState(() {
                          _periodtime = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              RaisedButton(
                child: Text(
                  'ยืนยัน',
                  style: TextStyle(color: Colors.white),
                ),
                color: Style().prinaryColor,
                 onPressed: () {
                  Navigator.pushNamed(
                    context,
                    AddDrugScreen.routeName,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

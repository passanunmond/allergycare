import 'package:flutter/material.dart';
import 'package:tuallergycare/screens/doctor/d_adddrug_screen.dart';
import 'package:tuallergycare/utility/style.dart';

class DrugSpay extends StatefulWidget {
  static const routeName = '/drugspray';
  DrugSpay({Key key}) : super(key: key);

  @override
  _DrugSpayState createState() => _DrugSpayState();
}

class _DrugSpayState extends State<DrugSpay> {
  String _quantityspray;
  String _selectedspray;
  List<Map> spraydrug = [
    {"id": '1', "image": "assets/images/avamys.png", "name": "Avamys®"},
    {"id": '2', "image": "assets/images/dymista.jpeg", "name": "Dymista®"},
    {"id": '3', "image": "assets/images/nasonex.jpeg", "name": "Nasonex®"},
  ];
  String timeusespray;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('เพิ่มการใช้ยา'),
      ),
      body: Container(
        //child: Center(
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
                        style: TextStyle(
                          fontSize: 20,
                          color: Style().prinaryColor
                        ),
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
                              "ชื่อยาสำหรับพ่น",
                              style: TextStyle(fontSize: 18),
                            ),
                            value: _selectedspray,
                            onChanged: (String newValue) {
                              setState(() {
                                _selectedspray = newValue;
                              });
                              print(_selectedspray);
                            },
                            items: spraydrug.map((Map map) {
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

              // SizedBox(
              //   height: 10,
              // ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 16),
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'จำนวนกด',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    ListTile(
                      title: const Text('1'),
                      leading: Radio(
                        activeColor: Theme.of(context).primaryColor,
                        value: '1',
                        groupValue: _quantityspray,
                        onChanged: (value) {
                          setState(() {
                            _quantityspray = value;
                          });
                          print(_quantityspray);
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('2'),
                      leading: Radio(
                        activeColor: Theme.of(context).primaryColor,
                        value: '2',
                        groupValue: _quantityspray,
                        onChanged: (value) {
                          setState(() {
                            _quantityspray = value;
                          });
                          print(_quantityspray);
                        },
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'ช่วงเวลา',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    ListTile(
                      title: const Text('เช้า'),
                      leading: Radio(
                        activeColor: Theme.of(context).primaryColor,
                        value: 'เช้า',
                        groupValue: timeusespray,
                        onChanged: (value) {
                          setState(() {
                            timeusespray = value;
                          });
                          print(timeusespray);
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('เย็น'),
                      leading: Radio(
                        activeColor: Theme.of(context).primaryColor,
                        value: 'เย็น',
                        groupValue: timeusespray,
                        onChanged: (value) {
                          setState(() {
                            timeusespray = value;
                          });
                          print(timeusespray);
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('เช้า-เย็น'),
                      leading: Radio(
                        activeColor: Theme.of(context).primaryColor,
                        value: 'เช้า-เย็น',
                        groupValue: timeusespray,
                        onChanged: (value) {
                          setState(() {
                            timeusespray = value;
                          });
                          print(timeusespray);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                child: Text(
                  'ยืนยัน',
                  style: TextStyle(color: Colors.white),
                ),
                color: Style().prinaryColor,
                onPressed: () {
                  // Navigator.pushNamed(context, AddDrugScreen.routeName,
                  //     arguments: {
                  //       _selectedspray,
                  //       _quantityspray,
                  //     }
                  //     );
                },
              ),
            ],
          ),
        ),
    //  ),
    );
  }
}

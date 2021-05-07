import 'package:flutter/material.dart';
import 'package:tuallergycare/screens/doctor/d_drugspay.dart';
import 'package:tuallergycare/utility/style.dart';
import 'package:tuallergycare/screens/doctor/d_bottomsheet_adddrug.dart';
import 'package:grouped_list/grouped_list.dart';

List _dataDrug = [
  {
    "albumId": 1,
    "id": 1,
    "type": "ยาพ่น",
    "nameDrug": "Aerius",
    "imagesDrug": "assets/images/aerius.png",
    "detailDrug": "ใช้สำหรับพ่นจมูก2ข้าง",
    "detailUse": "จำนวน 2 กดต่อข้างตอนเช้า"
  },
  {
    "albumId": 1,
    "id": 2,
    "type": "ยาพ่น",
    "nameDrug": "Avamys",
    "imagesDrug": "assets/images/avamys.png",
    "detailDrug": "ใช้สำหรับพ่นจมูก2ข้าง",
    "detailUse": "จำนวน 1 กดต่อข้างเย็น"
  },
];

class AddDrugScreen extends StatefulWidget {
  static const routeName = '/doctoradddrugscreen';

  @override
  _AddDrugScreenState createState() => _AddDrugScreenState();
}

class _AddDrugScreenState extends State<AddDrugScreen> {
  @override
  Widget build(BuildContext context) {
    //final selectedspray = ModalRoute.of(context).settings.arguments;
    // final selectedquantityspray =ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: const Text('เพิ่มการใช้ยา'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: BottomSheetTypeDrug(),
              ),
            ),
          );
          // Navigator.of(context).pushNamed(DrugSpay.routeName);
        },
        child: Icon(
          Icons.add,
          size: 40,
          color: Colors.white,
        ),
        backgroundColor: Style().prinaryColor,
      ),
      body: GroupedListView<dynamic, String>(
        elements: _dataDrug,
        groupBy: (element) => element['type'],
        groupSeparatorBuilder: (String groupByValue) => Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Flexible(
                  child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      groupByValue,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ))
            ],
          ),
        ),
        itemBuilder: (context, dynamic element) {
          return Card(
            elevation: 10,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: ClipRRect(
                    child: Image(
                      image: AssetImage(element['imagesDrug']),
                      fit: BoxFit.cover,
                      height: 100,
                      width: 100,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  )),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Text(
                              element['nameDrug'],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Text(
                              element['detailDrug'],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Text(
                              element['detailUse'],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: 10, right: 10, top: 5),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                RaisedButton(
                                  child: Text(
                                    'ยกเลิก',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  color: Colors.grey,
                                  onPressed: () {},
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                RaisedButton(
                                  child: Text(
                                    'แก้ไข',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  color: Colors.grey,
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
        itemComparator: (item1, item2) =>
            item1['nameDrug'].compareTo(item2['nameDrug']), // optional
        useStickyGroupSeparators: true, // optional
        floatingHeader: true, // optional
        order: GroupedListOrder.ASC, // optional

        
      ),
    );
  }
}

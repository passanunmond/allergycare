import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tuallergycare/widgets/info_card.dart';

const drug1 = "รูปยา";
const drug2 = "Desloratadine\nรับประทานครั้งละ 1\nเม็ดวันละ 1 ครั้ง ก่อนนอน";
const birthday1 = "วันเกิด";
const birthday2 = "27 เมษายน 2540";

class DrugTodayScreen extends StatefulWidget {
  static const routeName = '/drugtodayscreen';
  @override
  State<StatefulWidget> createState() {
    return DrugTodayScreenState();
  }
}

class DrugTodayScreenState extends State<DrugTodayScreen> {
  actionSheetMethod(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CupertinoActionSheet(
          title: Text(
            'บันทึกการใช้ยา',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          message: Text(
            'เวลา18:00',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          cancelButton: CupertinoActionSheetAction(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'ยกเลิก',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ),
          actions: <Widget>[
            CupertinoActionSheetAction(
              onPressed: () {},
              child: Text('ทำแล้ว'),
            ),
            CupertinoActionSheetAction(
              onPressed: () {},
              child: Text(
                'ยังไม่ได้ทำ',
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ยากินวันนี้'),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
            CupertinoButton(
              color: Colors.white,
              onPressed: () {
                actionSheetMethod(context);
              },
              child: Text(
                'Desloratadine',
              ),
            ),
            Container(
              child: Column(
                
                children: [
                  InfoCard(
                            text1: drug1, text2: drug2, onPressed: () async {}),
                ],
              ),
            )
          ]
              //child:
              ),
        ),
      ),
    );
  }
}

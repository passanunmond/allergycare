import 'package:flutter/material.dart';
import 'package:tuallergycare/screens/information_screen/medicine/medicine_screen.dart';
import 'package:tuallergycare/screens/information_screen/stimulus/stimulus_screen.dart';

class InformationScreen extends StatelessWidget {
  void selectMedicine(BuildContext context) {
    Navigator.of(context).pushNamed(
      MedicineScreen.routeName,
    );
  }

  void selectStimulus(BuildContext context) {
    Navigator.of(context).pushNamed(
      StimulusScreen.routeName,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: 100,
        color: Theme.of(context).primaryColor,
      ),
      
      Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            // SizedBox(
            //   height: 10,
            // ),
            InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: () => selectMedicine(context),
              child: Card(
                elevation: 6,
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      height: 100,
                      padding: EdgeInsets.fromLTRB(30, 32, 0, 0),
                      child: Text(
                        'วิธีการใช้ยา',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(180, 0, 0, 0),
                      height: 100,
                      child: Icon(
                        Icons.chevron_right_sharp,
                        size: 35,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 7,
            ),
            InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: () => selectStimulus(context),
              child: Card(
                elevation: 6,
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      height: 100,
                      padding: EdgeInsets.fromLTRB(30, 32, 0, 0),
                      child: Text(
                        'วิธีหลีกเลี่ยงสิ่งกระตุ้น',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(100, 0, 0, 0),
                      height: 100,
                      child: Icon(
                        Icons.chevron_right_sharp,
                        size: 35,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ]);
  }
}

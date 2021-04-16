import 'package:flutter/material.dart';

class StimulusScreen extends StatelessWidget {
  static const routeName = '/stimulus-info';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('วิธีหลีกเลี่ยงสิ่งกระตุ้น'),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Card(
                    elevation: 6,
                    child: Container(
                      height: 400,
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(30, 20, 0, 0),
                      child: Column(
                        children: [
                          Text(
                            'เชื้อรา',
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              // color: Theme.of(context).primaryColor),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            height: 150,
                            padding: EdgeInsets.all(15),
                            child: Image.asset('assets/images/avamys.png',
                                fit: BoxFit.cover),
                          ),
                          Text("ควรพยายามลดความชื้นในบ้านซึ่งอาจทำได้โดยการเปิดเครื่องปรับอากาศนอกจากนั้นการปิดหน้าต่างยังป้องกันไม่ให้สปอร์ของเชื้อราจากภายนอกเข้ามาในบ้าน ท่าน ควรกำจัดบริเวณที่ชื้นภายในบ้านเช่นถาดรองใต้ตู้เย็น และกระถางต้นไม้ วอลเปเปอร์ ม่านห้องน้ำ และห้องน้ำ ที่อับชื้น การล้างบริเวณดังกล่าวด้วยน้ำยาฟอกผ้าขาว (bleach) เช่น คลอร็อกซ์ (Clorox®) สามารถกำจัดเชื้อราได้"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

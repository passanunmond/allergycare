import 'package:flutter/material.dart';
import 'package:tuallergycare/screens/assess_screen.dart';
import 'package:tuallergycare/screens/auth_screen.dart';
import 'package:tuallergycare/screens/doctor/d_adddrug_screen.dart';
import 'package:tuallergycare/screens/doctor/d_appointment.dart';
import 'package:tuallergycare/screens/doctor/d_diagnose.dart';
import 'package:tuallergycare/screens/doctor/d_drugoral.dart';
import 'package:tuallergycare/screens/doctor/d_editprofilescreen.dart';
import 'package:tuallergycare/screens/doctor/d_form_screen.dart';
import 'package:tuallergycare/screens/doctor/d_home_screen.dart';
import 'package:tuallergycare/screens/doctor/d_patientprofile_screen.dart';
import 'package:tuallergycare/screens/doctor/d_skintest.dart';
import 'package:tuallergycare/screens/doctor/d_tabs_screen.dart';
import 'package:tuallergycare/screens/drugtoday_screen.dart';
import 'package:tuallergycare/screens/first_assess_screen.dart';
import 'package:tuallergycare/screens/form_screen.dart';
import 'package:tuallergycare/screens/home_screen.dart';
import 'package:tuallergycare/screens/information_screen/medicine/medicine_screen.dart';
import 'package:tuallergycare/screens/information_screen/stimulus/stimulus_screen.dart';
import 'package:tuallergycare/screens/profliepatient.dart';
import 'package:tuallergycare/screens/register_screen.dart';
import 'package:tuallergycare/screens/tabs_screen.dart';
import 'package:tuallergycare/screens/doctor/d_bottomsheet_adddrug.dart';
import 'package:tuallergycare/screens/doctor/d_drugspay.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: Color.fromRGBO(59, 155, 149, 1),
        accentColor: Colors.white,
      ),
      routes: {
        //'/': (ctx) => AuthScreen(),
        //'/': (ctx) => FirstAssessScreen(),
        //'/': (ctx) => HomeScreen(),
        '/': (ctx) => TabsDoctorScreen(),
        TabsScreen.routeName: (ctx) => TabsScreen(),
        TabsDoctorScreen.routeName: (ctx) => TabsDoctorScreen(),
        RegisterScreen.routeName: (ctx) => RegisterScreen(),
        MedicineScreen.routeName: (ctx) => MedicineScreen(),
        StimulusScreen.routeName: (ctx) => StimulusScreen(),
        AssessScreen.routeName: (ctx) => AssessScreen(),
        FormScreen.routeName: (ctx) => FormScreen(),
        AddDrugScreen.routeName: (ctx) => AddDrugScreen(),
        BottomSheetTypeDrug.routeName: (ctx) => BottomSheetTypeDrug(),
        DrugSpay.routeName: (ctx) => DrugSpay(),
        DrugOral.routeName: (ctx) => DrugOral(),
        Appointment.routeName: (ctx) => Appointment(),
        DoctorHomeScreen.routeName: (ctx) => DoctorHomeScreen(),
        Diagnose.routeName: (ctx) => Diagnose(),
        DoctorEditProfileScreen.routeName: (ctx) => DoctorEditProfileScreen(),
        PatientProfileScreen.routeName: (ctx) => PatientProfileScreen(),
        AddSkinTestScreen.routeName: (ctx) => AddSkinTestScreen(),
       Diagnose.routeName: (ctx) => Diagnose(), 

      },
    );
  }
}

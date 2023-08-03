import 'package:dako/driverDash.dart';
import 'package:dako/list.dart';
import 'package:dako/login.dart';
import 'package:dako/options.dart';
import 'package:dako/userDash.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "p1",
      routes: {
        "p1": ((context) => MyLogin()),
        "alert": ((context) => Alert()),
        "userDash": ((context) => SearchPage()),
        "option": ((context) => option()),
        "driverDash": ((context) => BlinkingButton()),
        "fadealert": ((context) => MyWidget6()),
        "list": ((context) => ListViewl()),
        "request": ((context) => Request()),
      },
    );
  }
}

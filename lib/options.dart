import 'package:dako/Model/incomingRequest.dart';
import 'package:dako/service.dart';
import 'package:dako/userDash.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class option extends StatefulWidget {
  const option({super.key});

  @override
  State<option> createState() => _optionState();
}

class _optionState extends State<option> {
  double x = 50;
  double xl = 70;
  double premier = 80;

  double? _value;

  _getValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _value = prefs.getDouble('distance');
    // print('ascheeeeeeeeeeeeeeeeeeee' + _value!);
  }

  @override
  initState() {
    // TODO: implement initState
    super.initState();
    _getValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navbar(),
      appBar: AppBar(
        title: Text('Dako'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                'shohag7421@gmail.com',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Text(
                'Available Options',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 16.0),
            Card(
              color: Color.fromARGB(255, 247, 248, 248),
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ListTile(
                leading: Icon(
                  Icons.directions_car,
                  color: Color.fromARGB(255, 27, 22, 22),
                ),
                title: Text(
                  'Dako X',
                  style: TextStyle(color: const Color.fromARGB(255, 12, 5, 5)),
                ),
                subtitle: Text(
                  'Affordable Everyday rides',
                  style: TextStyle(color: const Color.fromARGB(179, 15, 6, 6)),
                ),
                trailing: Text('BDT 220'),
                onTap: () {
                  // print('ashceeeee' + _value!);
                  Navigator.pushNamedAndRemoveUntil(
                      context, "alert", (route) => true);
                },
              ),
            ),
            SizedBox(height: 12.0),
            Card(
              color: Color.fromARGB(255, 247, 248, 248),
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ListTile(
                leading: Icon(
                  Icons.directions_car,
                  color: Color.fromARGB(255, 15, 1, 1),
                ),
                title: Text(
                  'Dako XL',
                  style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                ),
                subtitle: Text(
                  'Convenient ride for bigger groups',
                  style: TextStyle(color: const Color.fromARGB(179, 17, 1, 1)),
                ),
                trailing: Text('BDT 260'),
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, "alert", (route) => true);
                },
              ),
            ),
            SizedBox(height: 12.0),
            Card(
              color: Color.fromARGB(255, 247, 248, 248),
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ListTile(
                leading: Icon(
                  Icons.directions_car,
                  color: const Color.fromARGB(255, 17, 1, 1),
                ),
                title: Text(
                  'Dako Premier',
                  style: TextStyle(color: const Color.fromARGB(255, 8, 0, 0)),
                ),
                subtitle: Text(
                  'Comfortable sedans, Top quality Drivers',
                  style: TextStyle(color: const Color.fromARGB(179, 5, 0, 0)),
                ),
                trailing: Text('BDT 320'),
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, "alert", (route) => true);
                },
              ),
            ),
            SizedBox(height: 12.0),
            Card(
              color: const Color.fromARGB(255, 247, 248, 248),
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ListTile(
                leading: Icon(
                  Icons.directions_car,
                  color: const Color.fromARGB(255, 22, 1, 1),
                ),
                title: Text(
                  'Dako Rental',
                  style: TextStyle(color: const Color.fromARGB(255, 19, 1, 1)),
                ),
                subtitle: Text(
                  'Rent by hour/km',
                  style: TextStyle(color: const Color.fromARGB(179, 12, 0, 0)),
                ),
                trailing: Text('400/per Hour'),
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, "alert", (route) => true);
                },
              ),
            ),
            Spacer(),
            Center(
              child: Text(
                'Version 1.0.0',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}

class Alert extends StatefulWidget {
  const Alert({super.key});

  @override
  State<Alert> createState() => _AlertState();
}

class _AlertState extends State<Alert> {
  _call() async {
    Request request = new Request();
    request.clientName = 'Habib';
    request.pickup = 'Agargaon';
    request.dropup = 'Khilgaon';
    request.fare = 220;
    request.phone = '01537263505';
    request.status = false;
    await ApiService().saveReq(request);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Confirm?'),
      // content: Text('Modal Content'),
      actions: [
        TextButton(
          child: Text('Yes'),
          onPressed: () {
            Fluttertoast.showToast(
              msg: 'your Request has been sent',
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 4,
              backgroundColor: const Color.fromARGB(255, 17, 16, 16),
            );

            _call();
            Navigator.pushNamedAndRemoveUntil(
                context, "userDash", (route) => true);
          },
        ),
        TextButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

class MyWidget6 extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget6> {
  bool _showDialog = false;

  void _showDialogBox() {
    setState(() {
      _showDialog = true;
    });

    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _showDialog = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Auto-fading Dialog Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _showDialogBox,
          child: Text('Show Dialog'),
        ),
      ),
      floatingActionButton: _showDialog
          ? FloatingActionButton(
              onPressed: () {},
              child: Text('Dialog'),
            )
          : null,
    );
  }
}

_call2() async {
  Request request = new Request();
  request.clientName = 'Habib';
  request.pickup = 'Agargaon';
  request.dropup = 'Khilgaon';
  request.fare = 220;
  request.phone = '01537263505';
  request.status = false;
  await ApiService().saveReq(request);
}

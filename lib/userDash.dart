import 'package:dako/Model/route.dart';
import 'package:dako/service.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late List<Route1>? routeList = [];
  late double latitude1 = 0;
  late double longitude1 = 0;
  late double latitude2 = 0;
  late double longitude2 = 0;

  void _getData2() async {
    routeList = (await ApiService().getPosts2());
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(
          () {},
        ));
  }

  List<int> numbers = [1, 2, 3, 4, 5];

  var arr = ["jon", "irra", "tom", "Jery"];

  _loop() async {

    Navigator.pushNamedAndRemoveUntil(context, "option", (route) => true);
    // print(routeList!.length);

    print(_searchController);
    print(_searchController2);
    for (var name in routeList!) {
      print("------------------------");

      print(_searchController);

      if (_searchController.text == name.location) {
        latitude1 = name.latitude!;
        longitude1 = name.longitude!;
        print(latitude1);
        print(longitude1);
      }
      if (_searchController2.text == name.location) {
        latitude2 = name.latitude!;
        longitude2 = name.longitude!;
        print(latitude2);
        print(longitude2);
      }
    }

    double? dis = (await ApiService()
        .getDistance(latitude1, longitude1, latitude2, longitude2, 'km'));
    print(dis);

// Storing a value
    //  final storage = const FlutterSecureStorage();

    print("-------------------Double------------------");
    print(dis);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('distance', dis!);

    //Navigator.pushNamedAndRemoveUntil(context, "option", (route) => true);

// // Retrieving a value
// String value = prefs.getString('key');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData2();
  }

  List<String> dataList = [
    'Hazrat Shahjalal International Airport,Dhaka',
    'Khilgaon Railgate,Khilgaon,Dhaka',
    'Banani Graveyard',
    'Bashundhara Residential Area,Dhaka',
    'Abul Hotel,Malibagh,Dhaka',
    'Basabo',
    'Mohammadpur',
    'Jatrabari',
    'Kazipara',
    'Savar',
  ];
  List<String> filteredList = [];
  List<String> filteredList2 = [];

  TextEditingController _searchController = TextEditingController();
  TextEditingController _searchController2 = TextEditingController();

  void filterData(String query) {
    if (query.isNotEmpty) {
      setState(() {
        filteredList = dataList
            .where((data) => data.toLowerCase().contains(query.toLowerCase()))
            .take(2) // Set the number of suggestions to show (e.g., 2 or 3)
            .toList();
      });
    } else {
      setState(() {
        filteredList = [];
      });
    }
  }

  void filterData2(String query) {
    if (query.isNotEmpty) {
      setState(() {
        filteredList2 = dataList
            .where((data) => data.toLowerCase().contains(query.toLowerCase()))
            .take(2) // Set the number of suggestions to show (e.g., 2 or 3)
            .toList();
      });
    } else {
      setState(() {
        filteredList2 = [];
      });
    }
  }

  void selectSuggestion(String suggestion) {
    setState(() {
      _searchController.text = suggestion;
      filteredList = [];
    });
  }

  void selectSuggestion2(String suggestion) {
    setState(() {
      _searchController2.text = suggestion;
      filteredList2 = [];
    });
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
      body: Column(
        children: [
          Container(
            child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 40),
              child: TextField(
                controller: _searchController,
                onChanged: filterData,
                decoration: InputDecoration(
                  labelText: 'Set your Location',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 20),
              child: TextField(
                controller: _searchController2,
                onChanged: filterData2,
                decoration: InputDecoration(
                  labelText: 'Where to go ?',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10, top: 20),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(
                          255, 20, 20, 20), // Set the background color here
                    ),
                    onPressed: () {
                      _loop();

                      // Navigator.pushNamedAndRemoveUntil(
                      //     context, "option", (route) => true);
                    },
                    child: Text('search'))),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredList.length > 0
                  ? filteredList.length
                  : filteredList2.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(filteredList.length > 0
                      ? filteredList[index]
                      : filteredList2[index]),
                  onTap: () {
                    if (filteredList.length > 0) {
                      selectSuggestion(filteredList[index]);
                    } else {
                      selectSuggestion2(filteredList2[index]);
                      // _loop();
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(children: [
      UserAccountsDrawerHeader(
        accountName: const Text('Mahbubul Haque'),
        accountEmail: const Text('shohag7421@gmail.com'),
        // currentAccountPicture: CircleAvatar(
        //     child: ClipOval(child: Image.asset('assets/login.png'))),
      ),
      ListTile(
        leading: Icon(Icons.account_box_outlined),
        title: Text('My Profile'),
      ),
      ListTile(
        leading: Icon(Icons.settings),
        title: Text('Settings'),
      ),
      ListTile(
        leading: Icon(Icons.login_sharp),
        title: Text('logout'),
        onTap: () {
          Navigator.pushNamedAndRemoveUntil(context, "p1", (route) => true);
        },
      ),
    ]));
  }
}

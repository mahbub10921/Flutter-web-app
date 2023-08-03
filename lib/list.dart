
import 'package:dako/Model/route.dart';
import 'package:dako/service.dart';
import 'package:flutter/material.dart';

class ListViewl extends StatefulWidget {
  const ListViewl({super.key});

  @override
  State<ListViewl> createState() => _ListViewState();
}

class _ListViewState extends State<ListViewl> {
  
  late List<Route1>? getRoute = [];

  void _getData() async {
    getRoute = (await ApiService().getPosts2());
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(
          () {},
        ));
  }





  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }

  Widget _getPostList(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REST API Example for Post'),
        actions: [
          IconButton(
              onPressed: () {
                // Navigator.pushNamedAndRemoveUntil(
                //     context, "p5", (route) => false);

              
              },
              icon: Icon(Icons.arrow_back_ios_sharp))
        ],
      ),
      body: getRoute == null || getRoute!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
              // child: Text("No Data!!"),
            )
          : Center(
              child: ListView.builder(
                itemCount: getRoute!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: FlutterLogo(size: 72.0),
                    title: Text(getRoute![index].location.toString()),
                    subtitle: (Text(getRoute![index].latitude.toString())),
                    trailing: IconButton(
                      onPressed: () {
                       
                       
                      },
                      icon: Icon(Icons.update),
                    ),
                    isThreeLine: true,
                  );
                },
              ),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _getPostList(context);
  }
}

import 'dart:convert';
import 'dart:developer';

import 'package:dako/Model/incomingRequest.dart';
import 'package:dako/Model/route.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<void> deletePosts(int? id) async {
    try {
      var url = Uri.parse('http://192.168.20.38:8080/api/posts/' + '${id}');
      var response = await http.delete(url);

      // Response res = await delete('$apiUrl/$id');

      if (response.statusCode == 200) {
        print("Case deleted");
      } else {
        throw "Failed to delete a case.";
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<List<Route1>?> getPosts2() async {
    try {
      var url = Uri.parse('http://192.168.20.45:8080/api/route');
      // var url = Uri.parse('http://192.168.43.221:8080/api/route');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Route1> _model2 = postsFromJson2(response.body) as List<Route1>;
        return _model2;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  // Future<List<NewRegis>?> getNewReg() async {
  //   try {
  //     var url = Uri.parse('http://192.168.20.45:8080/api/custommmm');
  //     var response = await http.get(url);
  //     if (response.statusCode == 200) {
  //       print(response.body);
  //       List<NewRegis> _model2 = postsFromJson6(response.body);
  //       return _model2;
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }

  Future<double?> getDistance(
      double lat1, double long1, double lat2, double long2, String unit) async {
    try {
      print("$lat1 $lat2 $long1 $long2 $unit ");

      String sUrl =
          "http://192.168.20.45:8080/api/distanceCount?lat1=$lat1&lon1=$long1&lat2=$lat2&lon2=$long2&unit=$unit";
      print(sUrl);

      var url = Uri.parse(sUrl);
      var response = await http.get(url);
      print('okkkkkkkkk---------kkkkkkkkkkkkk');

      if (response.statusCode == 200) {
        print(response.body);
        String bb = response.body;

        double _distance = double.parse(bb);
        print("-------------------_distance------------------");
        print(_distance);
        return _distance;
      }
    } catch (e) {
      log(e.toString());
    }
    return 0.0;
  }

  // Future<List<PostModel>?> getPosts() async {
  //   try {
  //     var url = Uri.parse('http://192.168.20.38:8080/api/posts');
  //     var response = await http.get(url);
  //     if (response.statusCode == 200) {
  //       List<PostModel> _model =
  //           postsFromJson(response.body) as List<PostModel>;
  //       return _model;
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }

  Future<Request?> saveReq(Request request) async {
    try {
      var url = Uri.parse('http://192.168.20.38:8080/api/request');
      var response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(Request));
      if (response.statusCode == 200) {
        return null;
      } else {}
    } catch (e) {
      log(e.toString());
    }
  }

  // Future<NewRegis?> createNewReg(NewRegis newRegis) async {
  //   try {
  //     var url = Uri.parse('http://192.168.20.45:8080/api/newreg');
  //     var response = await http.post(url,
  //         headers: {"Content-Type": "application/json"},
  //         body: jsonEncode(newRegis));
  //     if (response.statusCode == 200) {
  //       return null;
  //     } else {}
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }
}

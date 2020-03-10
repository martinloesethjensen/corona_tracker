import 'package:corona_tracker/helpers/consts.dart';
import 'package:corona_tracker/models/stats.dart';
import 'package:hive/hive.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {

  Box statsBox = Hive.box(STATS_BOX);

  Future<void> getLatestStats() async {
    http.Response response = await http.get(BASE_URL + "/all");
    switch(response.statusCode) {
      case 200:
        var json = jsonDecode(response.body);
        statsBox.put("latest", json['latest']);
        break;
      default:
        return null;
    }
  }

//  Future<void> getAllStats() async {
//    http.Response response = await http.get(BASE_URL + "/all");
//    switch(response.statusCode) {
//      case 200:
//        var json = jsonDecode(response.body);
////        Stats stats = Stats.fromJson(json);
//        statsBox.put("allStats", json);
//        break;
//      default:
//        return null;
//    }
//  }

  Future<void> getConfirmedStats() async {
    http.Response response = await http.get(BASE_URL + "/confirmed");
    switch(response.statusCode) {
      case 200:
        var json = jsonDecode(response.body);
        statsBox.put("confirmed", json);
        break;
      default:
        return null;
    }
  }
}
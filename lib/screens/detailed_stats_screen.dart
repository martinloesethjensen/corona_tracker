import 'package:corona_tracker/helpers/consts.dart';
import 'package:corona_tracker/networking/api.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

final api = Api();

class DetailStatsScreen extends StatefulWidget {
  final String statType;

  DetailStatsScreen({@required this.statType});

  @override
  _DetailStatsScreenState createState() => _DetailStatsScreenState();
}

class _DetailStatsScreenState extends State<DetailStatsScreen> {
  @override
  Widget build(BuildContext context) {
    switch(widget.statType ?? "confirmed") {
      case "confirmed":
        api.getConfirmedStats();
        break;
      case "deaths":
        api.getDeathStats();
        break;
      case "recovered":
        api.getRecoveredStats();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.statType.capitalize),
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box(STATS_BOX).listenable(),
        builder: (BuildContext context, Box box, Widget child) {
          var latestStats =
              box.get(widget.statType, defaultValue: "No values found");
          List<dynamic> locations = latestStats["locations"];
          return ListView.builder(
            itemCount: locations.length,
            itemBuilder: (BuildContext context, int index) {
              String country = locations[index]["country"];
              dynamic latestCount = locations[index]["latest"];
              return ExpansionTile(
                title: Text(country),
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      ListTile(
                        title: Text("$latestCount"),
                      )
                    ],
                  )
                ],
              );
            },
          );
        },
      ),
    );
  }
}

extension on String {
  String get capitalize =>
      this[0].toUpperCase() + this.substring(1).toLowerCase();
}

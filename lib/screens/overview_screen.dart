import 'package:corona_tracker/helpers/consts.dart';
import 'package:corona_tracker/networking/api.dart';
import 'package:corona_tracker/screens/detailed_stats_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class OverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Api().getLatestStats();
    return Scaffold(
      appBar: AppBar(
        title: Text('Corona Stats'),
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box(STATS_BOX).listenable(),
        builder: (BuildContext context, Box box, Widget child) {
          var latestStats = box.get("latest", defaultValue: "No values found");
          List<dynamic> items = [
            {"confirmed": latestStats['confirmed']},
            {"deaths": latestStats['deaths']},
            {"recovered": latestStats['recovered']}
          ];
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              var item = items[index];
              String statType = item.keys.first;
              int number = item[statType];
              return ListTile(
                title: Text("${statType.toUpperCase()}: $number", textAlign: TextAlign.center,),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DetailStatsScreen(statType: statType,))),
              );
            },
          );
        },
      ),
    );
  }
}

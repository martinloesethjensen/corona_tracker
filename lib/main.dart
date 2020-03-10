import 'package:corona_tracker/helpers/consts.dart';
import 'package:corona_tracker/screens/overview_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(STATS_BOX);
  runApp(CoronaTrackerApp());
}

class CoronaTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Corona Tracker',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: OverviewScreen(),
    );
  }
}


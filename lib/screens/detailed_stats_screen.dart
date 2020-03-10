import 'package:corona_tracker/networking/api.dart';
import 'package:flutter/material.dart';

class DetailStatsScreen extends StatelessWidget {
  final String statType;

  DetailStatsScreen({@required this.statType});



  @override
  Widget build(BuildContext context) {
    Api().getConfirmedStats();
    return Scaffold(
      appBar: AppBar(
        title: Text(statType.capitalize),
      ),
    );
  }
}

extension on String {
  String get capitalize => this[0].toUpperCase() + this.substring(1).toLowerCase();
}

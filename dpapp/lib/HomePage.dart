// ignore_for_file: prefer_const_constructors

import 'package:dpapp/supplies.dart';
import 'package:flutter/material.dart';
import 'package:dpapp/weather/weather.dart';
import 'package:dpapp/emergencyContacts.dart';
import 'package:dpapp/evacCenter.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Disaster Preparedness App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GetRealTimeWeatherUpdates(),
                ),
              );
            },
            child: Text('Get Real-Time Weather Updates'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EmergencyContactsPage(),
                ),
              ); // Navigate to Emergency Contacts screen
            },
            child: Text('Emergency Contacts'),
          ),
          // ElevatedButton(
          //   onPressed: () {
          //     // Navigate to Evacuation Routes screen
          //   },
          //   child: Text('Blank'),
          // ),
          ElevatedButton(
            onPressed: () {
              // Navigate to Checklist screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Supplies(),
                ),
              );
            },
            child: Text('Checklist of Necessary Supplies'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EvacuationCentersMap(),
                ),
              ); // Navigate to Evacuation Centers screen
            },
            child: Text('Find Evacuation Centers'),
          ),
          ElevatedButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => DistressCall(),
              //   ),
              // );
            },
            child: Text('Send Distress Call'),
          ),
          ElevatedButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => RealTimeUpdatesMap(),
              //   ),
              // );
            },
            child: Text('Road Navigation Updates'),
          ),
        ],
      ),
    );
  }
}

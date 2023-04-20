// ignore_for_file: prefer_const_constructors

import 'package:dpapp/emergencyContacts.dart';
import 'package:dpapp/evacCenter.dart';
import 'package:dpapp/supplies.dart';
import 'package:dpapp/weather/weather.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Disaster Preparedness App'),
      ),
      body: Column(
        children: [
          SizedBox(height: 32),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: [
                  _buildButton(
                    context,
                    'Get Real-Time Weather Updates',
                    Icons.cloud,
                        () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GetRealTimeWeatherUpdates(),
                        ),
                      );
                    }, Colors.blue
                  ),
                  _buildButton(
                    context,
                    'Emergency Contacts',
                    Icons.phone,
                        () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EmergencyContactsPage(),
                        ),
                      );
                    }, Colors.red
                  ),
                  _buildButton(
                    context,
                    'Checklist of Necessary Supplies',
                    Icons.list_alt,
                        () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Supplies(),
                        ),
                      );
                    }, Colors.teal
                  ),
                  _buildButton(
                    context,
                    'Find Evacuation Centers',
                    Icons.location_on,
                        () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EvacuationCentersMap(),
                        ),
                      );
                    }, Colors.redAccent
                  ),
                  _buildButton(
                    context,
                    'Send Distress Call',
                    Icons.warning,
                        () {
                      // TODO: Navigate to distress call screen
                    }, Colors.amber,
                  ),
                  _buildButton(
                    context,
                    'Road Navigation Updates',
                    Icons.navigation,
                        () {
                      // TODO: Navigate to real-time updates map screen
                    }, Colors.green
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(
      BuildContext context,
      String text,
      IconData iconData,
      VoidCallback onPressed,
      Color color,
      ) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        backgroundColor: color,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(iconData, size: 48),
          SizedBox(height: 16),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

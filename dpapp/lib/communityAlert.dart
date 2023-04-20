import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CommunityAlertsPage extends StatefulWidget {
  @override
  _CommunityAlertsPageState createState() => _CommunityAlertsPageState();
}

class _CommunityAlertsPageState extends State<CommunityAlertsPage> {
  bool _isLoading = true;
  String _alertMessage = '';

  @override
  void initState() {
    super.initState();
    _fetchAlertMessage();
  }

  Future<void> _fetchAlertMessage() async {
    setState(() {
      _isLoading = true;
    });

    // Get user's current location
    final position = await Geolocator.getCurrentPosition();

    // Make an API request to obtain community-based alerts for the user's location
    final url = 'https://example.com/communityalerts?latitude=${position
        .latitude}&longitude=${position.longitude}';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final alerts = data['alerts'];

      // Check if there are any alerts for the user's location
      if (alerts.isNotEmpty) {
        setState(() {
          _alertMessage = alerts[0]['message'];
        });
      } else {
        setState(() {
          _alertMessage = 'No community-based alerts in your area';
        });
      }
    } else {
      setState(() {
        _alertMessage = 'Unable to fetch alerts at this time.';
      });
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Community Alerts'),
      ),
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : _alertMessage.isEmpty
            ? Text('No community-based alerts in your area')
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Community-based alert!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              _alertMessage,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

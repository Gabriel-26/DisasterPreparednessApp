import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GetRealTimeWeatherUpdates extends StatefulWidget {
  @override
  _GetRealTimeWeatherUpdatesState createState() => _GetRealTimeWeatherUpdatesState();
}

class _GetRealTimeWeatherUpdatesState extends State<GetRealTimeWeatherUpdates> {
  final TextEditingController _searchController = TextEditingController();
  Map<String, dynamic> _weatherData = {};

  Future<Map<String, dynamic>> _getWeatherData(String city) async {
    String url = 'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=9a6e120d8b4ec4d9bdfae9119a873a61&units=metric';
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  void _getWeather() async {
    final String city = _searchController.text;
    Map<String, dynamic> data = await _getWeatherData(city);
    setState(() {
      _weatherData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Real-Time Weather Updates'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Enter a city name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _getWeather,
              child: Text('Get Weather'),
            ),
            SizedBox(height: 10),
            if (_weatherData.isNotEmpty)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        '${_weatherData['name']}, ${_weatherData['sys']['country']}',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      Text(
                        '${_weatherData['weather'][0]['main']}',
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      Text(
                        '${_weatherData['main']['temp']}°C',
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

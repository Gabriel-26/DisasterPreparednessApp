import 'package:flutter/material.dart';

class DistressCall extends StatefulWidget {
  const DistressCall({Key? key}) : super(key: key);

  @override
  State<DistressCall> createState() => _DistressCallState();
}

class _DistressCallState extends State<DistressCall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Send Distress Call'),
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
                  _buildButton(context, 'In Case of Fire',
                      Icons.fire_truck, () {}, Colors.red),
                  _buildButton(context, 'In Case of Flood', Icons.flood,
                      () {}, Colors.blue),
                  _buildButton(context, 'In Case of Earthquake',
                      Icons.broken_image, () {}, Colors.teal),
                  _buildButton(context, 'List of Emergency Contacts',
                      Icons.location_on, () {
                    Navigator.of(context).pushNamed('/call');
                      }, Colors.lightGreen),
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

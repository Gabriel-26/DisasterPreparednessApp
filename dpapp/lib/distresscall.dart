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
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView(
                children: [
                  _buildButton(
                    context,
                    'In Case of Fire',
                    Icons.fire_truck,
                        () {},
                  ),
                  Divider(),
                  _buildButton(
                    context,
                    'In Case of Flood',
                    Icons.flood,
                        () {},
                  ),
                  Divider(),
                  _buildButton(
                    context,
                    'In Case of Earthquake',
                    Icons.broken_image,
                        () {},
                  ),
                  Divider(),
                  _buildButton(
                    context,
                    'List of Emergency Contacts',
                    Icons.list_alt,
                        () {
                      Navigator.of(context).pushNamed('/call');
                    },
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
      ) {
    return ListTile(
      onTap: onPressed,
      leading: Icon(iconData),
      title: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      trailing: Icon(Icons.arrow_forward),
    );
  }
}

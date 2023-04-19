import 'package:flutter/material.dart';

class EmergencyContactsPage extends StatelessWidget {
  final Map<String, String> emergencyContacts = {
    'Fire Department (Bureau of Fire Protection)': '160',
    'Ambulance': '161',
    'Philippine National Police': '117',
    'National Disaster Risk Reduction and Management Council': '02-8911-5061 to 65 (Landline) \n0917-891-0146 (Globe) \n0998-962-5005 (Smart)',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Contact Information'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: emergencyContacts.length,
          itemBuilder: (BuildContext context, int index) {
            final key = emergencyContacts.keys.elementAt(index);
            final value = emergencyContacts[key];
            return ListTile(
              title: Text(key),
              subtitle: Text(value!),
            );
          },
        ),
      ),
    );
  }
}

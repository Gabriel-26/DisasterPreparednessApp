import 'package:flutter/material.dart';

class DistressCall extends StatefulWidget {
  const DistressCall({Key? key}) : super(key: key);

  @override
  State<DistressCall> createState()=> _DistressCallState();
}

class _DistressCallState extends State<DistressCall>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Send Distress Call'),
      ),
    );
  }
}
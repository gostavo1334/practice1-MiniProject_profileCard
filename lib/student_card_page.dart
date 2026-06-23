import 'package:flutter/material.dart';

class StudentCardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Student ID Card')),
      body: Center(
        child: StudentIdCard(),
      ),
    );
  }
}

class StudentIdCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final info = [
      'Student Name : Sokha',
      'Student ID   : 2025001',
      'Major        : IT',
    ];

    return Container(
      width: 300,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Divider(color: Colors.white),
          Text(
            info.join('\n'),
            style: TextStyle(color: Colors.white, fontSize: 16, height: 1.8),
          ),
          Divider(color: Colors.white),
        ],
      ),
    );
  }
}
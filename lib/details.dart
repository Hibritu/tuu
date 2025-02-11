// details.dart
import 'package:flutter/material.dart';
import 'classmate.dart';

class Details extends StatelessWidget {
  final Classmate classmate;

  const Details({super.key, required this.classmate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("${classmate.name}'s Details"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/${classmate.photoUrl}", width: 200, height: 200),
            Text(classmate.name, style: const TextStyle(fontSize: 24)),
            Text(classmate.vision, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back'), // More concise button text
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class HistoryDetails extends StatelessWidget {
  String imagePath;

  HistoryDetails(this.imagePath, {super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[100],
        title: const Text(
          'Details Detection Image',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(imagePath),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Disease',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

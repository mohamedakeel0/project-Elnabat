import 'dart:io';

import 'package:flutter/material.dart';

class HistoryDetails extends StatelessWidget {
  String imagePath;
  String title;
  String data;

  HistoryDetails(this.imagePath,this. title,this.data ,{super.key});

  Widget build(BuildContext context) {
    print('2222222222222222222');
    print(imagePath);
    File file=File(imagePath);
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

              Image.file(
                file,
                fit: BoxFit.cover,width: double.infinity,
                height: 170,
              ),

               Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  data,
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

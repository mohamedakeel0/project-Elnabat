import 'dart:io';

import 'package:final_project/features/home/presentation/widgets/historyDetails.dart';
import 'package:flutter/material.dart';

class History extends StatelessWidget {
  String imagePath;
  String date;
  String title;

  History(this.imagePath, this.date,this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    File file=File(imagePath);
    return Column(
      children: [
        MaterialButton(
          splashColor: Colors.transparent,
          onPressed: () {
            Feedback.forTap(context);

            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => HistoryDetails(imagePath,title,date)));
          },
          child: Image.file(
            file,
            fit: BoxFit.cover,width: double.infinity,
            height: 170,
          )
        ),

        Container(
          margin: const EdgeInsets.only(top: 7),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 35,
              ),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                width: 35,
              ),
              Text(
                date,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

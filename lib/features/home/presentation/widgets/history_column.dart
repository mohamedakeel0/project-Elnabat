import 'package:final_project/features/home/presentation/widgets/history.dart';
import 'package:flutter/material.dart';

class HistoryColumn extends StatelessWidget {
  String date = " Sat, 13 Apr 2024  10:33:57 AM ";

  HistoryColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            History('assets/images/4.jpg', date),
            const SizedBox(height: 20),
            History('assets/images/6.jpg', date),
            const SizedBox(height: 20),
            History('assets/images/77.jpg', date),
            const SizedBox(height: 20),
            History('assets/images/2.jpg', date),
            const SizedBox(height: 20),
            History('assets/images/6.jpg', date),
            const SizedBox(height: 20),
            History('assets/images/5.jpg', date),
            const SizedBox(height: 20),
            History('assets/images/4.jpg', date),
            const SizedBox(height: 20),
            History('assets/images/3.jpg', date),
          ],
        ),
      ),
    );
  }
}

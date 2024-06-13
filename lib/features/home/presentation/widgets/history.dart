import 'package:final_project/features/home/presentation/widgets/historyDetails.dart';
import 'package:flutter/material.dart';

class History extends StatelessWidget {
  String imagePath;
  String date;

  History(this.imagePath, this.date, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MaterialButton(
          splashColor: Colors.transparent,
          onPressed: () {
            Feedback.forTap(context);

            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => HistoryDetails(imagePath)));
          },
          child: Container(
            width: double.infinity,
            height: 170,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage(imagePath)),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 35,
              ),
              Text(
                date,
                style: const TextStyle(
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

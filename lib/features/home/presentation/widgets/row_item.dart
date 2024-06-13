import 'package:flutter/material.dart';

class FirstRow extends StatelessWidget {
  const FirstRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          onTap: () {
            Feedback.forTap(context);
          },
          child: const CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/images/6.jpg'),
          ),
        ),
        const Icon(
          Icons.notifications_none,
          size: 35,
        )
      ],
    );
  }
}

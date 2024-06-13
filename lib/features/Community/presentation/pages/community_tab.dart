import 'package:final_project/features/Community/presentation/widgets/Card_Item.dart';
import 'package:final_project/features/Community/presentation/widgets/PostCard_Item.dart';
import 'package:flutter/material.dart';

class CommunityTab extends StatelessWidget {
  const CommunityTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'AI NABTA',
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: const [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CardItem(),
                  CardItem(),
                  CardItem(),
                  CardItem(),
                  CardItem(),
                  CardItem(),
                  CardItem(),
                  CardItem(),
                  CardItem(),
                  CardItem(),
                  CardItem(),
                ],
              ),
            ),
            SizedBox(
              height: 4.0,
            ),
            PostCardItem(),
            PostCardItem(),
            PostCardItem(),
            PostCardItem(),
            PostCardItem(),
            PostCardItem(),
            PostCardItem(),
            PostCardItem(),
            PostCardItem(),
            PostCardItem(),
            PostCardItem(),
            PostCardItem(),
          ],
        ),
      ),
    );
  }
}

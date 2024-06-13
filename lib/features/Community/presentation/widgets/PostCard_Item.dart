import 'package:flutter/material.dart';

class PostCardItem extends StatelessWidget {
  const PostCardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blueGrey,
                  radius: 20.0,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        'Habiba',
                      ),
                      SizedBox(
                        height: 1.0,
                      ),
                      Row(
                        children: [
                          Text(
                            '3h',
                            style: TextStyle(
                              fontSize: 9.0,
                            ),
                          ),
                          SizedBox(
                            width: 3.0,
                          ),
                          Icon(
                            Icons.public,
                            size: 9.0,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: 80.0,
              alignment: Alignment.centerLeft,
              child: const Text(
                'My Post',
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
            ),
            Row(
              children: [
                const Text(
                  '100',
                  style: TextStyle(),
                ),
                const SizedBox(
                  width: 3.0,
                ),
                const Spacer(),
                const Text('100 Comments'),
              ],
            ),
            Container(
              height: 40.0,
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.black12),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Image.asset('assets/images/singleLike.jpg'),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Image.asset('assets/images/comment.jpg'),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Image.asset('assets/images/share.jpg'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

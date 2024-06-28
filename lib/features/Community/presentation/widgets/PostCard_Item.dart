import 'package:flutter/material.dart';

class PostCardItem extends StatelessWidget {
  const PostCardItem({super.key, required this.time, required this.isLike, required this.comment, required this.name, required this.like});

final String name;
final String time;
final bool isLike;
final String comment;
final Function() like;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
             Row(
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
                        name,
                      ),
                      SizedBox(
                        height: 1.0,
                      ),
                      Row(
                        children: [
                          Text(
                            time,
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
              child:  Text(
               comment,
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
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
                  isLike==true?    Expanded(
                    child: InkWell(onTap: like,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Image.asset('assets/images/pngtree.png'),
                      ),
                    ),
                  ): InkWell(onTap: like,
                    child: Expanded(
                      child: InkWell(onTap: like,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Image.asset('assets/images/singleLike.jpg'),
                        ),
                      ),
                    ),
                  ),
                  isLike==true?Expanded(
                    child: InkWell(onTap: like,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Image.asset('assets/images/dislike.webp'),
                      ),
                    ),
                  ):  Expanded(
                    child: InkWell(onTap: like,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Image.asset('assets/images/dislike-button.png'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Image.asset('assets/images/comment.jpg'),
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

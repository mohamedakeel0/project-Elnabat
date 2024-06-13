import 'package:final_project/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(MyColors.mainColor)),
      onPressed: () {},
      child: const Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(Icons.search, color: Colors.white),
          Text(
            'search for plant',
            style: TextStyle(fontSize: 16, color: Colors.white),
          )
        ],
      ),
    );
  }
}

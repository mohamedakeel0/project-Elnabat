import 'package:flutter/material.dart';

class LoadingAlertDialog extends StatelessWidget {
  TextStyle style = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  Widget build(BuildContext context) {
    return AlertDialog(
        content: Container(
            height: MediaQuery.of(context).size.height * .2,
            width: MediaQuery.of(context).size.width * .2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: CircularProgressIndicator(
                  color: Colors.green,
                )),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Sign Out...",
                  style: style,
                )
              ],
            )));
  }
}

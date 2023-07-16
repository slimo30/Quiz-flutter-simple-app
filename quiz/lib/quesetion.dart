import 'package:flutter/material.dart';

class Quesetion extends StatelessWidget {
  final String QuesetionText;
  final Color x;
  Quesetion({super.key, required this.QuesetionText, required this.x});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          SizedBox(

            
            height: 10,
          ),
          Text(
            QuesetionText,
            style: TextStyle(
              fontSize: 25,
              color: x,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

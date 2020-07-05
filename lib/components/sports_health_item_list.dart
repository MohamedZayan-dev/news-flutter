import 'package:flutter/material.dart';

class SportsHealth extends StatelessWidget {
  final String picUrl;
  final String title;

  SportsHealth({this.title, this.picUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Image.network(picUrl),
          ),
          SizedBox(
            height: 5,
          ),
          Text(title),
          SizedBox(
            height: 7,
          ),
          Divider(
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}

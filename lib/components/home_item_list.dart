import 'package:flutter/material.dart';
import 'package:news/constants.dart';

class HomeListItem extends StatelessWidget {
  final String picSource;
  final String text;

  HomeListItem({this.picSource, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 20, top: 12, left: 10, bottom: 12),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Image.network(picSource),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 5,
                child: Text(
                  text,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Divider(
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}

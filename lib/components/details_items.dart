import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class DetailsItems extends StatelessWidget {
  String picUrl;
  String title;
  String date;
  String bodyText;

  DetailsItems({this.picUrl, this.title, this.date, this.bodyText});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            constraints: BoxConstraints.expand(height: 200),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(picUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            date,
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(
            height: 6,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, top: 5),
            child: Text(bodyText),
          ),
        ],
      ),
    );
  }
}

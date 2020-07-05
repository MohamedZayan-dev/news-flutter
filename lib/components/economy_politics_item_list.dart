import 'package:flutter/material.dart';

class EconomyPolitics extends StatelessWidget {
  String picUrl;
  String title;

  EconomyPolitics({this.title, this.picUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(children: <Widget>[
        Container(
          constraints: BoxConstraints.expand(
            height: 200.0,
          ),
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.only(left: 16.0, bottom: 8.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(picUrl),
              fit: BoxFit.cover,
            ),
          ),
          child: Text(
            title.toUpperCase(),
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
              shadows: [
                Shadow(
                    offset: Offset(2.0, 1.0),
                    color: Color(0xFF25134E),
                    blurRadius: 2),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Divider(
          thickness: 2,
        ),
      ]),
    );
  }
}

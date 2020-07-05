import 'package:flutter/material.dart';
import 'package:news/components/details_items.dart';

class Details extends StatelessWidget {
  String picUrl;
  String title;
  String date;
  String bodyText;
  Details({this.picUrl, this.title, this.date, this.bodyText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Details'),
        ),
        backgroundColor: Color(0xFF324149),
      ),
      body: SingleChildScrollView(
        child: DetailsItems(
          picUrl: picUrl,
          title: title,
          date: date,
          bodyText: bodyText,
        ),
      ),
    );
  }
}

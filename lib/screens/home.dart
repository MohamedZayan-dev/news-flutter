import 'package:flutter/material.dart';
import 'package:news/app_bloc.dart';
import 'package:news/components/home_item_list.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:news/components/sports_health_item_list.dart';
import 'package:news/model/main_screens.dart';
import 'package:news/screens/sports.dart';
import 'package:news/services/newsData.dart';

import 'details.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<MainScreenModel> items = [];

  void updateUi() async {
    String picUrl;
    String title;
    String date;
    String bodyText;

    var response = await NewsHelper().getDataForHome();
    if (response != null) {
      for (int i = 0; i < 50; i++) {
        if ((response)['response']['results'][i]['fields']['thumbnail'] != null)
          picUrl = (response)['response']['results'][i]['fields']['thumbnail'];
        else
          picUrl =
              'https://media.guim.co.uk/34f84041c36ce6462de63b317ce6732461885fd3/0_208_4250_2550/500.jpg';
        title = (response)['response']['results'][i]['webTitle'];
        date = (response)['response']['results'][i]['webPublicationDate'];
        bodyText = (response)['response']['results'][i]['fields']['bodyText'];
        setState(() {
          items.add(MainScreenModel(
              picUrl: picUrl, title: title, date: date, bodyText: bodyText));
        });
      }
    } else {
      picUrl = 'Nothing';
      title = 'A7A';
      date = 'don\'t know';
      bodyText = 'tnta';
      items.add(MainScreenModel(
          picUrl: picUrl, title: title, date: date, bodyText: bodyText));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('init state');
    updateUi();
  }

  @override
  Widget build(BuildContext context) {
    appBloc.updateTitle('Home');
    return ListView.builder(
      itemBuilder: (context, index) {
        print("index $index");
        return GestureDetector(
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Details(
                  picUrl: items[index].picUrl,
                  title: items[index].title,
                  date: items[index].date,
                  bodyText: items[index].bodyText,
                ),
              ),
            );
          },
          child: HomeListItem(
            picSource: items[index].picUrl,
            text: items[index].title,
          ),
        );
      },
      itemCount: items.length,
    );
  }
}

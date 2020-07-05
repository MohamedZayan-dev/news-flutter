import 'package:flutter/material.dart';
import 'package:news/components/sports_health_item_list.dart';
import 'package:news/model/main_screens.dart';
import 'package:news/services/newsData.dart';

import '../app_bloc.dart';
import 'details.dart';

class Health extends StatefulWidget {
  @override
  _HealthState createState() => _HealthState();
}

class _HealthState extends State<Health> {
  List<MainScreenModel> items = [];

  void updateUi() async {
    String picUrl;
    String title;
    String date;
    String bodyText;
    var response = await NewsHelper().getDataForHealth();
    if (response != null) {
      for (int i = 0; i < 50; i++) {
        if ((response)['response']['results'][i]['fields']['thumbnail'] != null)
          picUrl = (response)['response']['results'][i]['fields']['thumbnail'];
        else
          picUrl = 'https://media.guim.co.uk/34f84041c36ce6462de63b317ce6732461885fd3/0_208_4250_2550/500.jpg';
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
    updateUi();
  }

  @override
  Widget build(BuildContext context) {
    appBloc.updateTitle('Health');
    return ListView.builder(
      itemBuilder: (context, index) {
        return GestureDetector(
          child: SportsHealth(
            picUrl: items[index].picUrl,
            title: items[index].title,
          ),
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
        );
      },
      itemCount: items.length,
    );
  }
}

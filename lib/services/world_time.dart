import "package:http/http.dart";
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime {
  bool isDaytime;
  String location;
  String time;
  String flag;
  String url;

  WorldTime({ this.location, this.flag, this.url });

  Future<void> getTime() async {
    try {
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];
      String offset = data['utc_offset'];

      DateTime now = DateTime.parse(datetime)
          .add(Duration(hours: int.parse(offset.substring(1, 3))));

      time = DateFormat.jm().format(now);
      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
    } catch (e) {
      print(e);
    }

  }

}

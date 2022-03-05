import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location; // location name for the UI
  late String time; // the time in that location
  String flag; // url to an asset flag icon
  String url; // location url for api endpoint
  late bool isDaytime; // true || false if daytime or not

  WorldTime(this.location, this.flag, this.url);

  Future<void> getTime() async {
    try {
      Response response = await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      // print(data);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      // print(datetime);
      // print(offset);

      DateTime now = DateTime.parse(datetime);
      // print(now);
      // now is non-destructive, so need to update new value
      now = now.add(Duration(hours: int.parse(offset)));
      // print(now);

      time = DateFormat.jm().format(now);
      isDaytime = now.hour > 6 && now.hour < 20; // is the time right now between 6am to 8pm
    } catch (e) {
      print('caught error: $e');
      time = 'could not get time data';
    }
  }
}

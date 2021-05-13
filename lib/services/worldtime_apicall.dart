import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
// import 'package:world_time_app/pages/choose_location.dart';

class FetchTime {
  String location;
  String url;
  String flag;
  String time;
  bool isDay = true;

  FetchTime({this.location, this.url, this.flag});

  Future<void> getTime() async {
    try {
      //api call
      Response res = await get('http://worldtimeapi.org/api/timezone/$url');
      //converting string to map
      Map data = jsonDecode(res.body);
      print(data);
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      //    make as datetime obj
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      //check if day or not
      isDay = now.hour > 6 && now.hour < 17 ? true : false;

      time = DateFormat.jm().format(now);
    } catch (e) {
      print(e);
      time = "error in fetching time";
    }
  }
}

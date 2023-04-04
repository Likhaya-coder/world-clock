import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class GetWorldTime {
  late String location;  //get the location
  late String time;
  late String flag; //url of an image in the asset folder
  late String url;  //location that the user is selecting

  GetWorldTime({required this.location, required this.flag, required this.url});

  late bool isDayTime;

  Future <void> setTime() async {
    Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
    Map data = jsonDecode(response.body);

    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);

    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));

    isDayTime = now.hour > 6 && now.hour < 20 ? true : false;

    time = DateFormat().add_jm().format(now);
  }
}
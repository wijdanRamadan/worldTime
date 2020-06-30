import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';

class CountryTime {

  String location;
  String time;
  List countries;



  CountryTime(this.location);
  Future <void> getTime(url) async
  {
    try {
      Response response = await get(
          'http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      time = DateFormat.jm().format(now);
      location=url;

    }
    catch(e)
    {print ('could not load time ');}

  }


  Future<List> getEuropeanCountries() async
  {
    Response response = await get('http://worldtimeapi.org/api/timezone/Europe');
    List countries = jsonDecode(response.body);
    return countries;
  }

}
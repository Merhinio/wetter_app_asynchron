import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wetterklein/models/weather.dart';
class WeatherRepository {
  

  List<String> citys = [];

  Future<WeatherData> getWeather(String city) async {
    const url = 'https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&current=temperature_2m,relative_humidity_2m,apparent_temperature,is_day,precipitation';
    final response =
        await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
    print ('response: ${response.body}');

      return WeatherData.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Fehler beim Laden des Wetters');
    }
  }

  
}

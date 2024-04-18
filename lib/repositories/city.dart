
import 'package:http/http.dart' as http;
import 'package:wetterklein/models/city.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:wetterklein/models/weather.dart';


class CityRepository {
  static const _apiKey = 'rYkezFAMBbcNtarWsjzSIQ==ERbAaz9XBucuDcNt';
  Future<City> getCity(String city) async {
    final url = 'https://api.api-ninjas.com/v1/geocoding?city=$city';
    final response =
        await http.get(Uri.parse(url), headers: {'X-Api-Key': _apiKey});
    if (response.statusCode == 200) {
      ('response: ${response.body}');
      final jsonData = jsonDecode(response.body);
      return City.fromJson(jsonData[0]);
    } else {
      throw Exception('Failed to load weather');
    }
  }
  Future<City?> getSavedCity() async {
    final prefs = await SharedPreferences.getInstance();
    final cityString = prefs.getString('city');
    if (cityString == null) return null;
    final jsonMap = jsonDecode(cityString);
    final cityObject = City.fromJson(jsonMap);
    return cityObject;
  }
  Future<void> saveCity(City city) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('city', jsonEncode(city.toJson()));
  }
  

  Future<Weather?> getSavedWeather() async {
    final prefs = await SharedPreferences.getInstance();
    final weatherString = prefs.getString('weather');
    if (weatherString == null) return null;
    final jsonMap = jsonDecode(weatherString);
    final weatherObject = Weather.fromJson(jsonMap);
    return weatherObject;
    
  }

  Future <void> saveWeather(Weather weather) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('weather', jsonEncode(weather.toJson()));
  }
}
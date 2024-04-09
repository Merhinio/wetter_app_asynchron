import 'package:flutter/material.dart';
import 'package:wetterklein/models/weather.dart';
import 'package:wetterklein/repositories/repo.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

late Future<WeatherData> futureWeatherData;

@override
  void initState() {
    super.initState();
    futureWeatherData = WeatherRepository().getWeather('München');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column( mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center ( 
            child: FutureBuilder<WeatherData>(
              future: futureWeatherData, 
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      Text('Stadt: ${snapshot.data!.city}'),
                      Text('Gefühlte Temperatur : ${snapshot.data!.tempFeeling}'),
                      Text('Temperatur: ${snapshot.data!.tempReal}'),
                      Text('Niederschlag: ${snapshot.data!.precipitation}'),
                      Text('Tageszeit: ${snapshot.data!.isDay}'),
                      Text('Standort: lat  : ${snapshot.data!.longitude} : long : ${snapshot.data!.latitude}'),
                     
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              },
            ),
          ),
        ],
      ),
    );
  }
}

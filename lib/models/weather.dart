class WeatherData {
  final String city;
  final double tempFeeling;
  final double tempReal;
  final double precipitation;
  final bool isDay;
  final double longitude;
  final double latitude;

  
  WeatherData({
    required this.city,
    required this.tempFeeling,
    required this.tempReal,
    required this.precipitation,
    required this.isDay,
    required this.longitude,
    required this.latitude,
  });

  

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      city: json['city'],
      tempFeeling: json['apparent_temperature'],
      tempReal: json['temperature_2m'],
      precipitation: json['precipitation'],
      isDay: json['is_day'],
      longitude: json['longitude'],
      latitude: json['latitude'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'city': city,
      'apparent_temperature': tempFeeling,
      'temperature_2m': tempReal,
      'precipitation': precipitation,
      'is_day': isDay,
      'longitude': longitude,
      'latitude': latitude,
    };
  }
}
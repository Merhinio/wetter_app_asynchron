class Weather {
  
  final double tempFeeling;
  final double tempReal;
  final double precipitation;
  final bool isDay;
  final double longitude;
  final double latitude;

  
  Weather({
    
    required this.tempFeeling,
    required this.tempReal,
    required this.precipitation,
    required this.isDay,
    required this.longitude,
    required this.latitude,
  });

  

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
     
      tempFeeling: json['current']['apparent_temperature'],
      tempReal: json['current']['temperature_2m'],
      precipitation: json['current']['precipitation'],
      isDay: json['current']['is_day'] == 1 ? true : false,
      longitude: json['longitude'],
      latitude: json['latitude'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      
      'apparent_temperature': tempFeeling,
      'temperature_2m': tempReal,
      'precipitation': precipitation,
      'is_day': isDay,
      'longitude': longitude,
      'latitude': latitude,
    };
  }  
}
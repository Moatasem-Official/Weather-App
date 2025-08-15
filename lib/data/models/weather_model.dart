import 'package:responsive_ui/domain/entities/weather_entity.dart';

class WeatherModel extends WeatherEntity {
  WeatherModel({
    required super.areaName,
    required super.date,
    required super.time,
    required super.minTemp,
    required super.maxTemp,
    required super.theTemp,
    required super.weatherState,
    required super.icon,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      areaName: json['location']['name'],
      date: json['location']['localtime'],
      time: json['location']['localtime'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      theTemp: json['current']['temp_c'],
      weatherState: json['current']['condition']['text'],
      icon: json['current']['condition']['icon'],
    );
  }
  static String formatTime(DateTime time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }

  static String formatDate(DateTime time) {
    return '${time.day.toString().padLeft(2, '0')}/${time.month.toString().padLeft(2, '0')}/${time.year.toString().padLeft(4, '0')}';
  }
}

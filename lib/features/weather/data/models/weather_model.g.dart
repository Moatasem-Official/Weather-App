// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) => WeatherModel(
  areaName: json['location']['name'] as String,
  date: json['forecast']['forecastday'][0]['date'] as String,
  time: json['location']['localtime'] as String,
  minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'].toString(),
  maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'].toString(),
  theTemp: json['current']['temp_c'].toString(),
  weatherState: json['current']['condition']['text'] as String,
  icon: "https:${json['current']['condition']['icon']}",
);

Map<String, dynamic> _$WeatherModelToJson(WeatherModel instance) =>
    <String, dynamic>{
      'areaName': instance.areaName,
      'date': instance.date,
      'time': instance.time,
      'minTemp': instance.minTemp,
      'maxTemp': instance.maxTemp,
      'theTemp': instance.theTemp,
      'weatherState': instance.weatherState,
      'icon': instance.icon,
    };

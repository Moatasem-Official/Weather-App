// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) => WeatherModel(
  areaName: json['areaName'] as String,
  date: json['date'] as String,
  time: json['time'] as String,
  minTemp: json['minTemp'] as String,
  maxTemp: json['maxTemp'] as String,
  theTemp: json['theTemp'] as String,
  weatherState: json['weatherState'] as String,
  icon: json['icon'] as String,
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

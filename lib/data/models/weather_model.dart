import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:responsive_ui/domain/entities/weather_entity.dart';

part 'weather_model.g.dart';

@JsonSerializable()
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

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);

  static String formatTime(DateTime time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }

  static String formatDate(DateTime time) {
    return '${time.day.toString().padLeft(2, '0')}/${time.month.toString().padLeft(2, '0')}/${time.year.toString().padLeft(4, '0')}';
  }
}

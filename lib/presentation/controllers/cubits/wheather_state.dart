import 'package:responsive_ui/domain/entities/weather_entity.dart';

sealed class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final WeatherEntity weatherEntity;
  WeatherLoaded(this.weatherEntity);
}

class WeatherError extends WeatherState {
  final String message;
  WeatherError(this.message);
}

class WeatherWrongCity extends WeatherState {
  final String searchCity;
  WeatherWrongCity(this.searchCity);
}

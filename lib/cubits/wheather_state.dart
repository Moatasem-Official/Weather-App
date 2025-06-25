import 'package:responsive_ui/model/weather_model.dart';

sealed class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final WeatherModel weatherModel;
  WeatherLoaded(this.weatherModel);
}

class WeatherError extends WeatherState {
  final String message;
  WeatherError(this.message);
}

class WeatherWrongCity extends WeatherState {
  final String searchCity;
  WeatherWrongCity(this.searchCity);
}

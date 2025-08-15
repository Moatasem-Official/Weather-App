import 'package:responsive_ui/domain/entities/weather_entity.dart';

abstract class WeatherRepo {
  Future<WeatherEntity> fetchWeatherDataFromApi({required String cityName});
}

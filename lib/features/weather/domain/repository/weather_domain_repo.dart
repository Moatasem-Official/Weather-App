import 'package:responsive_ui/features/weather/domain/entities/weather_entity.dart';

abstract class WeatherDomainRepo {
  Future<WeatherEntity> fetchWeatherDataFromApi({required String cityName});
}

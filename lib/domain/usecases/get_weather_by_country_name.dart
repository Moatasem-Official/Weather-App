import 'package:responsive_ui/domain/entities/weather_entity.dart';
import 'package:responsive_ui/domain/repository/weather_repo.dart';

class GetWeatherByCountryName {
  final WeatherRepo weatherRepo;
  GetWeatherByCountryName({required this.weatherRepo});

  Future<WeatherEntity> call({required String cityName}) async {
    return await weatherRepo.fetchWeatherDataFromApi(cityName: cityName);
  }
}

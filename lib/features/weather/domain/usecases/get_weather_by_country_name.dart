import 'package:responsive_ui/features/weather/domain/entities/weather_entity.dart';
import 'package:responsive_ui/features/weather/domain/repository/weather_domain_repo.dart';

class GetWeatherByCountryName {
  final WeatherDomainRepo weatherDomainRepo;
  GetWeatherByCountryName({required this.weatherDomainRepo});

  Future<WeatherEntity> call({required String cityName}) async {
    return await weatherDomainRepo.fetchWeatherDataFromApi(cityName: cityName);
  }
}

import 'package:responsive_ui/domain/entities/weather_entity.dart';
import 'package:responsive_ui/domain/repository/weather_domain_repo.dart';

class GetWeatherByCountryName {
  final WeatherDomainRepo weatherDomainRepo;
  GetWeatherByCountryName({required this.weatherDomainRepo});

  Future<WeatherEntity> call({required String cityName}) async {
    return await weatherDomainRepo.fetchWeatherDataFromApi(cityName: cityName);
  }
}

import 'package:responsive_ui/core/utils/app_constants.dart';
import 'package:responsive_ui/data/datasource/remote_data_source.dart';
import 'package:responsive_ui/domain/entities/weather_entity.dart';
import 'package:responsive_ui/domain/repository/weather_domain_repo.dart';

class WeatherDataRepo implements WeatherDomainRepo {
  final RemoteDataSource remoteDataSource;
  WeatherDataRepo(this.remoteDataSource);

  @override
  Future<WeatherEntity> fetchWeatherDataFromApi({
    required String cityName,
  }) async {
    return await remoteDataSource.fetchWeatherDataFromApi(
      cityName,
      AppConstants.kWeatherApiKey,
      7,
      'no',
      'no',
    );
  }
}

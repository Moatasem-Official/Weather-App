import 'package:dio/dio.dart';
import 'package:responsive_ui/core/utils/app_constants.dart';
import 'package:responsive_ui/features/weather/data/models/weather_model.dart';
import 'package:retrofit/retrofit.dart';

part 'remote_data_source.g.dart';

@RestApi(baseUrl: AppConstants.kWeatherApiBaseUrl)
abstract class RemoteDataSource {
  factory RemoteDataSource(Dio dio, {String baseUrl}) = _RemoteDataSource;

  @GET(AppConstants.kWeatherApiEndpoint)
  Future<WeatherModel> fetchWeatherDataFromApi(
    @Query('key') String apiKey,
    @Query('q') String cityName,
    @Query('days') int days,
    @Query('aqi') String aqi,
    @Query('alerts') String alerts,
  );
}

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:responsive_ui/features/weather/data/datasource/remote_data_source.dart';
import 'package:responsive_ui/features/weather/data/repository/weather_data_repo.dart';
import 'package:responsive_ui/features/weather/domain/usecases/get_weather_by_country_name.dart';
import 'package:responsive_ui/features/weather/presentation/controllers/cubits/wheather_cubit.dart';

final GetIt getIt = GetIt.instance;

void initInjection() {
  getIt.registerSingleton<RemoteDataSource>(
    RemoteDataSource(createAndSetupDio()),
  );
  getIt.registerSingleton<WeatherDataRepo>(
    WeatherDataRepo(getIt.get<RemoteDataSource>()),
  );
  getIt.registerSingleton<GetWeatherByCountryName>(
    GetWeatherByCountryName(weatherDomainRepo: getIt.get<WeatherDataRepo>()),
  );
  getIt.registerFactory<WeatherCubit>(
    () => WeatherCubit(getIt.get<GetWeatherByCountryName>()),
  );
}

Dio createAndSetupDio() {
  final dio = Dio();

  dio.interceptors.add(
    LogInterceptor(
      error: true,
      request: true,
      responseHeader: false,
      requestHeader: false,
      responseBody: true,
      requestBody: true,
    ),
  );
  return dio;
}

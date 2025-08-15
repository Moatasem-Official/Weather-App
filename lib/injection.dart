import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:responsive_ui/data/datasource/remote_data_source.dart';
import 'package:responsive_ui/data/repository/weather_data_repo.dart';

final GetIt getIt = GetIt.instance;

void initInjection() {
  getIt.registerSingleton<RemoteDataSource>(
    RemoteDataSource(createAndSetupDio()),
  );
  getIt.registerSingleton<WeatherDataRepo>(
    WeatherDataRepo(getIt.get<RemoteDataSource>()),
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

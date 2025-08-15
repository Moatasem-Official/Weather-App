import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_ui/domain/usecases/get_weather_by_country_name.dart';
import 'package:responsive_ui/presentation/controllers/cubits/wheather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final GetWeatherByCountryName getWeatherByCountryName;
  WeatherCubit(this.getWeatherByCountryName) : super(WeatherInitial());

  Future<void> fetchWeatherDataFromApi({required String cityName}) async {
    emit(WeatherLoading());
    try {
      final weatherEntity = await getWeatherByCountryName.call(
        cityName: cityName,
      );
      emit(WeatherLoaded(weatherEntity));
    } catch (e) {
      emit(WeatherError(e.toString()));
    }
  }

  void reset() => emit(WeatherInitial());
}

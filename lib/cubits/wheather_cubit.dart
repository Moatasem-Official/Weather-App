import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_ui/cubits/wheather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());

  Future<void> fetchWeatherDataFromApi({required String cityName}) async {}
}

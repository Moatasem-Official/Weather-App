import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_ui/cubits/wheather_state.dart';
import 'package:http/http.dart' as http;
import 'package:responsive_ui/model/weather_model.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());

  Future<void> fetchWeatherDataFromApi({required String cityName}) async {
    final String apiKey = '005280c3705048a8aef181748251206';
    emit(WeatherLoading());
    try {
      final response = await http.get(
        Uri.parse(
          'https://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=$cityName&days=7&aqi=no&alerts=no',
        ),
      );
      //https://api.weatherapi.com/v1/forecast.json?key=005280c3705048a8aef181748251206&q=egypt&days=7&aqi=no&alerts=no
      //https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric
      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedResponse = jsonDecode(response.body);
        WeatherModel weatherModel = WeatherModel.fromJson(decodedResponse);
        emit(WeatherLoaded(weatherModel));
      } else {
        emit(WeatherWrongCity(super.toString()));
      }
    } catch (e) {
      emit(WeatherError(e.toString()));
    }
  }
}

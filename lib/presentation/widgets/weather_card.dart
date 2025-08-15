import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_ui/domain/entities/weather_entity.dart';

class WeatherCard extends StatelessWidget {
  final WeatherEntity weatherEntity;

  const WeatherCard({super.key, required this.weatherEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.25,
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color:
            weatherEntity.weatherState.contains('Cloud')
                ? Colors.grey
                : weatherEntity.weatherState.contains('rain')
                ? const Color.fromARGB(255, 156, 193, 223)
                : weatherEntity.weatherState.contains('Snow')
                ? const Color.fromARGB(255, 226, 205, 205)
                : weatherEntity.weatherState.contains('Clear')
                ? Colors.blue
                : weatherEntity.weatherState.contains('Thunderstorm')
                ? const Color.fromARGB(255, 54, 51, 51)
                : weatherEntity.weatherState.contains('Drizzle')
                ? Colors.purple
                : weatherEntity.weatherState.contains('Overcast')
                ? Colors.blueGrey
                : weatherEntity.weatherState.contains('Thunder')
                ? Colors.black
                : weatherEntity.weatherState.contains('Sunny')
                ? Colors.yellow
                : Colors.red,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                weatherEntity.areaName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                weatherEntity.date,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              Text(
                weatherEntity.time,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              child: Row(
                spacing: 20,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Max Temp : ${weatherEntity.maxTemp.toString()} °C',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'Min Temp : ${weatherEntity.minTemp.toString()} °C',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: Image.network(weatherEntity.icon)),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AVG Temp',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          '${weatherEntity.theTemp.toString()} °C',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Text(
            weatherEntity.weatherState,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

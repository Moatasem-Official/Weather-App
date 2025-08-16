import 'package:flutter/material.dart';
import 'package:responsive_ui/features/weather/domain/entities/weather_entity.dart';

class WeatherCard extends StatelessWidget {
  final WeatherEntity weatherEntity;

  const WeatherCard({super.key, required this.weatherEntity});

  LinearGradient _getGradient(String condition) {
    if (condition.contains('Cloud')) {
      return const LinearGradient(colors: [Colors.grey, Colors.blueGrey]);
    } else if (condition.contains('rain') || condition.contains('Rain')) {
      return const LinearGradient(colors: [Colors.blueGrey, Colors.lightBlue]);
    } else if (condition.contains('Snow')) {
      return const LinearGradient(colors: [Colors.white, Colors.blueGrey]);
    } else if (condition.contains('Clear')) {
      return const LinearGradient(
        colors: [Colors.blue, Colors.lightBlueAccent],
      );
    } else if (condition.contains('Thunder')) {
      return const LinearGradient(colors: [Colors.black54, Colors.grey]);
    } else if (condition.contains('Sunny')) {
      return const LinearGradient(colors: [Colors.orange, Colors.yellow]);
    }
    return const LinearGradient(colors: [Colors.red, Colors.orange]);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.28,
      margin: const EdgeInsets.all(12.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        gradient: _getGradient(weatherEntity.weatherState),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Location and date
          Column(
            children: [
              Text(
                weatherEntity.areaName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "${weatherEntity.date} • ${weatherEntity.time}",
                style: const TextStyle(color: Colors.white70, fontSize: 16),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Max: ${weatherEntity.maxTemp}°C',
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Text(
                    'Min: ${weatherEntity.minTemp}°C',
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
              Image.network(weatherEntity.icon, width: 80, height: 80),
              Column(
                children: [
                  const Text(
                    'Avg Temp',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  Text(
                    '${weatherEntity.theTemp}°C',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),

          Text(
            weatherEntity.weatherState,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}

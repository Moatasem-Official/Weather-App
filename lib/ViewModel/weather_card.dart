import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WeatherCard extends StatelessWidget {
  final String city;
  final String date;
  final String time;
  final String minTemp;
  final String maxTemp;
  final String currentTemp;
  final String weatherStatus;
  final String weatherIcon;

  const WeatherCard({
    super.key,
    required this.city,
    required this.date,
    required this.time,
    required this.minTemp,
    required this.maxTemp,
    required this.currentTemp,
    required this.weatherStatus,
    required this.weatherIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.25,
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color:
            weatherStatus.contains('Cloud')
                ? Colors.grey
                : weatherStatus.contains('rain')
                ? const Color.fromARGB(255, 156, 193, 223)
                : weatherStatus.contains('Snow')
                ? const Color.fromARGB(255, 226, 205, 205)
                : weatherStatus.contains('Clear')
                ? Colors.blue
                : weatherStatus.contains('Thunderstorm')
                ? const Color.fromARGB(255, 54, 51, 51)
                : weatherStatus.contains('Drizzle')
                ? Colors.purple
                : weatherStatus.contains('Overcast')
                ? Colors.blueGrey
                : weatherStatus.contains('Thunder')
                ? Colors.black
                : weatherStatus.contains('Sunny')
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
                city,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                date,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              Text(
                time,
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
                          'Max Temp : ${maxTemp.toString()} °C',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'Min Temp : ${minTemp.toString()} °C',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: Image.network(weatherIcon)),
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
                          '${currentTemp.toString()} °C',
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
            weatherStatus,
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

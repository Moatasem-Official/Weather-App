class WeatherModel {
  final String areaName;
  final String date;
  final String time;
  final String minTemp;
  final String maxTemp;
  final String theTemp;
  final String weatherState;
  final String icon;

  WeatherModel({
    required this.areaName,
    required this.date,
    required this.time,
    required this.minTemp,
    required this.maxTemp,
    required this.theTemp,
    required this.weatherState,
    required this.icon,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      areaName: json['location']['name'],
      date: formatDate(DateTime.parse(json['location']['localtime'])),
      time: formatTime(DateTime.parse(json['location']['localtime'])),
      minTemp:
          json['forecast']['forecastday'][0]['day']['mintemp_c'].toString(),
      maxTemp:
          json['forecast']['forecastday'][0]['day']['maxtemp_c'].toString(),
      theTemp:
          json['forecast']['forecastday'][0]['day']['avgtemp_c'].toString(),
      weatherState:
          json['forecast']['forecastday'][0]['day']['condition']['text']
              .toString(),
      icon:
          'https:${json['forecast']['forecastday'][0]['day']['condition']['icon']}',
    );
  }

  static String formatTime(DateTime time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }

  static String formatDate(DateTime time) {
    return '${time.day.toString().padLeft(2, '0')}/${time.month.toString().padLeft(2, '0')}/${time.year.toString().padLeft(4, '0')}';
  }
}

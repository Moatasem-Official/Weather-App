import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_ui/presentation/widgets/weather_card.dart';
import 'package:responsive_ui/cubits/wheather_cubit.dart';
import 'package:responsive_ui/cubits/wheather_state.dart';

class WheatherScreen extends StatelessWidget {
  WheatherScreen({super.key});

  var searchValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Weather'),
        toolbarHeight: 120,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            height: 50,
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: TextField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search for a city',
                  prefixIcon: Icon(Icons.search),
                ),
                onSubmitted: (searchValue) async {
                  await (context).read<WeatherCubit>().fetchWeatherDataFromApi(
                    cityName: searchValue.trim(),
                  );
                },
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            children: [
              BlocBuilder<WeatherCubit, WeatherState>(
                builder: (context, state) {
                  return state is WeatherInitial
                      ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              'https://img.freepik.com/free-vector/404-error-with-robot-concept-illustration_335657-2330.jpg?w=2000',
                              width: 300,
                              height: 300,
                            ),
                            const Text(
                              'Welcome, Search For A City',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              'Or Use The Search Bar Above',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      )
                      : state is WeatherLoading
                      ? const Center(child: CircularProgressIndicator())
                      : state is WeatherLoaded
                      ? AspectRatio(
                        aspectRatio: 1 / 1,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                          child: WeatherCard(
                            city: state.weatherModel.areaName,
                            date: state.weatherModel.date,
                            time: state.weatherModel.time,
                            maxTemp: state.weatherModel.maxTemp,
                            minTemp: state.weatherModel.minTemp,
                            currentTemp: state.weatherModel.theTemp,
                            weatherStatus: state.weatherModel.weatherState,
                            weatherIcon: state.weatherModel.icon,
                          ),
                        ),
                      )
                      : state is WeatherError
                      ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              'https://img.freepik.com/free-vector/404-error-with-robot-concept-illustration_335657-2330.jpg?w=2000',
                              width: 300,
                              height: 300,
                            ),
                            const Text(
                              'Error',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      )
                      : state is WeatherWrongCity
                      ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              'https://img.freepik.com/free-vector/404-error-with-robot-concept-illustration_335657-2330.jpg?w=2000',
                              width: 300,
                              height: 300,
                            ),
                            const Text(
                              'Wrong Searched City',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              'You Can Search For A City',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      )
                      : Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

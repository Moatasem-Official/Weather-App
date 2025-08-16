import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_ui/features/weather/presentation/widgets/initial_search_widget.dart';
import 'package:responsive_ui/features/weather/presentation/widgets/search_error_widget.dart';
import 'package:responsive_ui/features/weather/presentation/widgets/weather_card.dart';
import 'package:responsive_ui/features/weather/presentation/controllers/cubits/wheather_cubit.dart';
import 'package:responsive_ui/features/weather/presentation/controllers/cubits/wheather_state.dart';

class WheatherScreen extends StatefulWidget {
  const WheatherScreen({super.key});

  @override
  State<WheatherScreen> createState() => _WheatherScreenState();
}

class _WheatherScreenState extends State<WheatherScreen> {
  var searchValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Weather',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
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
                onSubmitted: (value) async {
                  searchValue = value.trim();
                  if (searchValue.isEmpty) {
                    context.read<WeatherCubit>().reset();
                    return;
                  }
                  await context.read<WeatherCubit>().fetchWeatherDataFromApi(
                    cityName: searchValue,
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
                      ? InitialStateSeachWidget()
                      : state is WeatherLoading
                      ? SizedBox(
                        height: MediaQuery.sizeOf(context).height - 200,
                        child: const Center(child: CircularProgressIndicator()),
                      )
                      : state is WeatherLoaded
                      ? SizedBox(
                        height: MediaQuery.sizeOf(context).height - 200,
                        child: AspectRatio(
                          aspectRatio: 1 / 1,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                            child: WeatherCard(
                              weatherEntity: state.weatherEntity,
                            ),
                          ),
                        ),
                      )
                      : state is WeatherError
                      ? SearchErrorWidget()
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

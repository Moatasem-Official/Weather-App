import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_ui/bloc_observer.dart';
import 'package:responsive_ui/presentation/controllers/cubits/wheather_cubit.dart';
import 'package:responsive_ui/injection.dart';
import 'package:responsive_ui/presentation/screens/wheather_screen.dart';

void main() {
  initInjection();
  Bloc.observer = BlocObserverClass();
  runApp(DevicePreview(enabled: true, builder: (context) => MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<WeatherCubit>(),
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'Poppins'),
        home: WheatherScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

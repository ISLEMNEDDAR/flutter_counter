import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter/weather/bloc/weather_bloc.dart';
import 'package:flutter_counter/weather/presentation/weather_view.dart';
import 'package:flutter_counter/weather/service/weather.service.dart';
import 'package:meta/meta.dart';

class AppWeather extends StatelessWidget {
  final WeatherService weatherService;
  AppWeather({
    Key key,@required this.weatherService
  }) : assert(weatherService != null),
  super (key : key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title : "Weather",
      debugShowCheckedModeBanner: false,
      theme : ThemeData(),
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(brightness: Brightness.dark),
      home : BlocProvider(
        create : (context) =>
            WeatherBloc(weatherService : weatherService),
        child : WeatherView()
      )
    );
  }
}

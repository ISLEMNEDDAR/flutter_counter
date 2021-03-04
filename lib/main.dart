import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_counter/app.dart';
import 'package:flutter_counter/auth/repository/authentication_repository.dart';
import 'package:flutter_counter/auth/repository/user_repository.dart';
import 'package:flutter_counter/counter_observer.dart';
import 'package:flutter_counter/weather/bloc/observer.dart';
import 'package:flutter_counter/weather/model/weather_model.dart';
import 'package:flutter_counter/weather/repository/weather_repository.dart';
import 'package:flutter_counter/weather/service/weather.service.dart';
import 'package:http/http.dart' as http;
import 'auth/presentation/app.dart';
import 'weather/presentation/weather_app.dart';

void main() {
  //BlocObserver observer = CounterObserver();
  /*runApp(App(
    authenticationRepository : AuthenticationRepository(),
    userRepository : UserRepository()
  ));*/
  Bloc.observer = StateObserver();
  final WeatherService weatherService = WeatherService(
      weatherRepository: WeatherRepository(httpClient: http.Client())
  );
  runApp(AppWeather(weatherService : weatherService));
}
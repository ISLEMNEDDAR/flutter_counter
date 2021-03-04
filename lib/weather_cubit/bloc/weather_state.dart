import 'package:equatable/equatable.dart';
import 'package:flutter_counter/weather/model/weather_model.dart';
import 'package:meta/meta.dart';
abstract class WeatherStates extends Equatable{
  const WeatherStates();

  @override
  List<Object> get props => [];
}

class WeatherEmpty extends WeatherStates {}

class WeatherLoading extends WeatherStates {}

class WeatherLoaded extends WeatherStates {
  final Weather weather;

  WeatherLoaded({@required this.weather}) : assert(weather != null);

  @override
  List<Object> get props => [weather];
}

class WeatherError extends WeatherStates {}
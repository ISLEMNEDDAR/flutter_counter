import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class WeatherEvents extends Equatable {
  const WeatherEvents();
}

class FetchWeatherEvent extends WeatherEvents {
  final String city;
  FetchWeatherEvent({@required this.city}) : assert(city != null);

  @override
  List<Object> get props => [city];
}

class RefreshWeatherEvent extends WeatherEvents {
  final String city;
  const RefreshWeatherEvent({@required this.city}) : assert(city != null);

  @override
  List<Object> get props => [city];
}

class ResetWeatherEvent extends WeatherEvents {
  @override
  List<Object> get props => null;
}
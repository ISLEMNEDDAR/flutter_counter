import 'package:flutter_counter/weather/model/weather_model.dart';
import 'package:flutter_counter/weather/repository/weather_repository.dart';
import 'package:meta/meta.dart';

class WeatherService {
  final WeatherRepository weatherRepository;
  WeatherService({@required this.weatherRepository}) : assert(weatherRepository != null);

  Future<Weather> getWeather(String city){
    return weatherRepository.getWeather(city);
  }
}
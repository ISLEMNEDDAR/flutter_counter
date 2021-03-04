import 'package:bloc/bloc.dart';
import 'package:flutter_counter/weather/bloc/weather_event.dart';
import 'package:flutter_counter/weather/bloc/weather_state.dart';
import 'package:flutter_counter/weather/model/weather_model.dart';
import 'package:flutter_counter/weather/service/weather.service.dart';
import 'package:meta/meta.dart';

class WeatherBloc extends Bloc<WeatherEvents,WeatherStates>{
  final WeatherService weatherService;
  WeatherBloc({@required this.weatherService})
  :assert(weatherService != null),
  super(WeatherEmpty());

  @override
  Stream<WeatherStates> mapEventToState(WeatherEvents event) async* {
    if(event is FetchWeatherEvent){
      yield WeatherLoading();
      try{
        final Weather weather = await weatherService.getWeather(event.city);
        yield WeatherLoaded(weather: weather);
      }catch(error){
        print(error);
        yield WeatherError();
      }
    }
    if(event is RefreshWeatherEvent){
      try {
        final Weather weather = await weatherService.getWeather(event.city);
        yield WeatherLoaded(weather: weather);
      } catch (error) {
        print("Error" + error);
        yield state;
      }
    }
    if(event is ResetWeatherEvent){
      yield WeatherEmpty();
    }
  }
  
  
  
  
}
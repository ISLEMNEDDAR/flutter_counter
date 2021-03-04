import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter/weather/bloc/weather_bloc.dart';
import 'package:flutter_counter/weather/bloc/weather_event.dart';
import 'package:flutter_counter/weather/bloc/weather_state.dart';

import 'component/dispalyweather.dart';
import 'component/entercity.dart';
class WeatherView extends StatefulWidget {
  @override
  _WeatherViewState createState() => _WeatherViewState();
}
Completer<void> refreshCompleter;

class _WeatherViewState extends State<WeatherView> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.black
    ));
    return Scaffold(
      backgroundColor: Color(0xff00001f),
      body: BlocConsumer<WeatherBloc,WeatherStates>(
        listener: (context, WeatherStates state){
          if(state is WeatherLoaded){
            print("state weather laoded");
            refreshCompleter?.complete();
            refreshCompleter = Completer();
          }
        },
        builder: (context,WeatherStates state){
          print(context);
          print(state);
          if(state is WeatherEmpty){
            return EnterCity();
          }
          if(state is WeatherLoading){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if(state is WeatherLoaded){
            final weather = state.weather;
            return RefreshIndicator(
              onRefresh : (){
                //TODO : where we can change state
                BlocProvider.of<WeatherBloc>(context)
                    .add(RefreshWeatherEvent(city : weather.location));
                return refreshCompleter.future;
              },
              child: ListView(
                children: <Widget>[
                  DisplayWeather(weather : weather)
                ],
              ),
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Spacer(),
              Padding(
                padding : const EdgeInsets.only(left : 35,right : 30),
                child : Text(
                  'Could not fetch weather for given location',
                  style : TextStyle(color :Colors.white),
                  textAlign: TextAlign.center,
                )
              ),
              SizedBox(
                height : 20
              ),
              Container(
                child : GestureDetector(
                  onTap : (){
                    BlocProvider.of<WeatherBloc>(context).add(ResetWeatherEvent());
                  },
                  child : InkWell(
                    child : Icon (
                      Icons.search,
                      size : 30
                    )
                  )
                )
              ),
              Spacer(),
            ],
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    refreshCompleter = Completer<void>();
  }
}

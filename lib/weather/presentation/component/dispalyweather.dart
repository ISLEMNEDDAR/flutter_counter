import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter/weather/bloc/weather_bloc.dart';
import 'package:flutter_counter/weather/bloc/weather_event.dart';
import 'package:flutter_counter/weather/model/weather_model.dart';
import 'package:meta/meta.dart';
import 'dart:async';
import 'package:intl/intl.dart';
class DisplayWeather extends StatelessWidget {
  final Weather weather;
  final DateTime now = DateTime.now();

  DisplayWeather({@required this.weather});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top : 80,left: 20),
                    child: Container(
                      child: Text(
                        //TODO weather.location
                        "weater location",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding : const EdgeInsets.only(top : 10,left : 20),
                    child : Container(
                      child : Text(
                        DateFormat('EEEE MMMM d, yyyy hh:mm a').format(now),
                        style : TextStyle(
                          fontSize: 14,fontWeight: FontWeight.normal
                        ),
                      )
                    )
                  )
                ],
              ),
              Spacer(),
              Padding(
                padding : const EdgeInsets.only(top: 65,right : 20),
                child: Container(
                  child : GestureDetector(
                    onTap : (){
                      BlocProvider.of<WeatherBloc>(context).add(ResetWeatherEvent());
                    },
                    child : InkWell(
                      child: Icon(
                        Icons.search,
                        size : 30
                      ),
                    )
                  )
                ),
              )
            ],
          ),
          Padding(
            padding : const EdgeInsets.only(top : 10),
            child: Row(
              children: [
                Spacer(),
                Container(
                  child : Image.network(
                    'http://openweathermap.org/img/wn/' +
                        //TODO weather.icon +
                        "03d" +
                        '@2x.png',
                    scale: 0.8,
                    color: Colors.white,
                  )
                ),
                Spacer()
              ],
            ),
          ),
          Padding(
            padding : const EdgeInsets.only(top : 10),
            child : Row(
              children : <Widget>[
                Spacer(),
                Container(
                  child : Text(
                    //TODO weather.currentTemp
                      (293.85 - 275.5).floor().toString()+"°",
                    style: TextStyle(fontSize: 70,fontWeight: FontWeight.w400),
                  )
                ),
                Spacer()
              ]
            )
          ),
          Padding(
            padding : const EdgeInsets.only(top : 10),
            child: Row(
              children: <Widget>[
                Spacer(),
                Container(
                  child : Text(
                    //TODO weather.condition
                    "Clouds",
                    style : TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color : Colors.white
                    )
                  ),
                ),
                Spacer()
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 55, left: 30, right: 30),
            child: Row(
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Text(
                          //TODO weather.windSpeed
                          17.toString() + 'km/h',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Text(
                          'Wind',
                          style: TextStyle(fontSize: 15),
                        ),
                      )
                    ],
                  ),
                ),
                Spacer(),
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Text(
                          //TODO weather.humidity.toString() + '%',
                          15.toString() + '%',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Text(
                          'Humidity',
                          style: TextStyle(fontSize: 15),
                        ),
                      )
                    ],
                  ),
                ),
                Spacer(),
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Text(
                         //TODO (weather.maxTemp - 275.5).floor().toString() + '°',
                          (258 - 275.5).floor().toString() + '°',


                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Text(
                          'Maximum',
                          style: TextStyle(fontSize: 15),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

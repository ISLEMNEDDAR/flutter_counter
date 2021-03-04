import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter/weather/bloc/weather_bloc.dart';
import 'package:flutter_counter/weather/bloc/weather_event.dart';

final weatherCityController = TextEditingController();

class EnterCity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return SafeArea(
        child: Form(
          key: formKey,
          child : Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color : Colors.blueAccent[100],
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40)
                    )
                ),
                child: Padding(
                    padding : const EdgeInsets.only(top : 50),
                    child : Center(
                        child : Padding(
                            padding : const EdgeInsets.only(bottom : 25),
                            child : Text(
                                "Search for weadth",
                                style : TextStyle(color: Colors.white,fontSize: 30)
                            )
                        )
                    )
                ),
              ),
              Spacer(),
              Padding(
                  padding : const EdgeInsets.only(left : 32,right : 32),
                  child : Container(
                      child : TextFormField(
                        controller: weatherCityController,
                        keyboardType: TextInputType.text,
                        keyboardAppearance: Brightness.light,
                        enableSuggestions: true,
                        textInputAction: TextInputAction.search,
                        validator: (value){
                          if(value.isEmpty) return "Enter City Name";
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: "Enter City Name",
                          focusColor: Colors.blueAccent[100],
                          alignLabelWithHint: true,
                          hintText: "Eg London",
                          prefixIcon : Icon(Icons.location_on),
                          helperText: "Enter the location for which you want to search",
                        ),
                      )
                  )
              ),
              RaisedButton(
                  onPressed: (){
                    if(formKey.currentState.validate()){
                      print(weatherCityController.text);
                      //TODO fetchWeahteer event
                      BlocProvider.of<WeatherBloc>(context)
                          .add(FetchWeatherEvent(city: weatherCityController.text));
                    }
                  },
                  color : Colors.blueAccent[100],
                  splashColor: Colors.black,
                  padding : EdgeInsets.only(left : 32, right : 32),
                  shape : RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                    side : BorderSide(color : Colors.blueAccent),
                  ),
                  child : Padding(
                      padding : const EdgeInsets.only(left : 32,right : 32),
                      child : Text('Search',
                          style : TextStyle(color : Colors.white,fontSize : 20))
                  )
              ),
              Spacer(),
              SafeArea(
                  child : Container(
                      child : Text("This app is a demo app for flutter vloc patten")
                  )
              )
            ],
          )
        )
    );
  }
}

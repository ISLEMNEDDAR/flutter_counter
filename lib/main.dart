import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_counter/app.dart';
import 'package:flutter_counter/auth/repository/authentication_repository.dart';
import 'package:flutter_counter/auth/repository/user_repository.dart';
import 'package:flutter_counter/counter_observer.dart';

void main() {
  //BlocObserver observer = CounterObserver();
  runApp(const App(
    authenticationRepository : AuthenticationRepository(),
    userRepository : UserRepository()
  ));
}
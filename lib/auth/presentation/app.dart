import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter/auth/bloc/authentication_bloc.dart';
import 'package:flutter_counter/auth/bloc/authentication_state.dart';
import 'package:flutter_counter/auth/repository/authentication_repository.dart';
import 'package:flutter_counter/auth/repository/user_repository.dart';
import 'package:flutter_counter/splach/presentation/splash.dart';

class App extends StatelessWidget {
  const App({
    Key key,
    @required this.authenticationRepository,
    @required this.userRepository,
  })  : assert(authenticationRepository != null),
        assert(userRepository != null),
        super(key : key);

  final AuthenticationRepository authenticationRepository;
  final UserRepository userRepository;
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: authenticationRepository,
      child: BlocProvider(
        create: (_) => AuthenticationBloc(
          authenticationRepository: authenticationRepository,
          userRepository: userRepository,
        ),
        child: AppView(),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  @override
  AppViewState createState() => AppViewState();
}

class AppViewState extends State<AppView>{
  final navigatorKey = GlobalKey<NavigatorState>();
  NavigatorState get navigator => navigatorKey.currentState;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey : navigatorKey,
      builder: (context,child){
        return BlocListener<AuthenticationBloc,AuthenticationState>(
          listener : (context,state){
              switch(state.status){
                case AuthenticationStatus.authenticated:
                  //navigator.pushAndRemoveUntil(Homepage.route(), (route) => false);
                  break;
                case AuthenticationStatus.unauthenticated :
                  //navigator.pushAndRemoveUntil(LoginPage.route(), (route) => false);
                  break;
                default :
                  break;
              }
          }
        );
      },
      onGenerateRoute: (_) => SplashPage.route(),
    );
  }
}


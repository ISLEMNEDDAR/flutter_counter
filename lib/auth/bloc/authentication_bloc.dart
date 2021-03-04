import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_counter/auth/bloc/authentication_event.dart';
import 'package:flutter_counter/auth/model/user_model.dart';
import 'package:flutter_counter/auth/repository/authentication_repository.dart';
import 'package:flutter_counter/auth/repository/user_repository.dart';
import 'authentication_state.dart';
import 'package:meta/meta.dart';
class AuthenticationBloc extends Bloc<AuthenticationEvent,AuthenticationState>{

  AuthenticationBloc({
    @required AuthenticationRepository authenticationRepository,
    @required UserRepository userRepository,
  })  : assert(authenticationRepository != null),
        assert(userRepository != null),
        _authenticationRepository = authenticationRepository,
        _userRepository = userRepository,
        super(const AuthenticationState.unkown()) {
    authenticationStatusSubscreption = _authenticationRepository.status.listen(
          (status) => add(AuthenticationStatusChanged(status)),
    );
  }


  final AuthenticationRepository _authenticationRepository;
  final UserRepository _userRepository;
  StreamSubscription<AuthenticationStatus> authenticationStatusSubscreption;

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event
      ) async*{
    if(event is AuthenticationStatusChanged){
      yield await mapAuthenticationStatusChangedToState(event);
    }else if(event is AuthenticationLogoutRequested){
      _authenticationRepository.logOut();
    }
  }

  @override
  Future<void> close() {
    authenticationStatusSubscreption?.cancel();
    _authenticationRepository.dispose();
    return super.close();
  }

  Future<AuthenticationState> mapAuthenticationStatusChangedToState(
      AuthenticationStatusChanged event,
      ) async {
    switch (event.status) {
      case AuthenticationStatus.unauthenticated:
        return const AuthenticationState.unauthenticated();
      case AuthenticationStatus.authenticated:
        final user = await _tryGetUser();
        return user != null
            ? AuthenticationState.authenticated(user)
            : const AuthenticationState.unauthenticated();
      default:
        return const AuthenticationState.unkown();
    }
  }

  Future<User> _tryGetUser() async {
    try {
      final user = await _userRepository.getUser();
      return user;
    } on Exception {
      return null;
    }
  }
}
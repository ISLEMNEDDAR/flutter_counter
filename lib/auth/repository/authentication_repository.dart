import 'dart:async';
import 'package:meta/meta.dart';
enum AuthenticationStatus {
  unknown, authenticated, unauthenticated
}

class AuthenticationRepository {
  final controller = StreamController<AuthenticationStatus>();

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* controller.stream;
  }

  Future<void> logIn({
    @required String username,
    @required String password
  })async{
    assert(username != null);
    assert(password != null);
    await Future.delayed(
      const Duration(milliseconds: 300),
        ()=>controller.add(AuthenticationStatus.unauthenticated)
    );
  }

  void logOut(){
    controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => controller.close();
}
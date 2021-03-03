import 'package:flutter_counter/auth/model/user_model.dart';
import 'package:uuid/uuid.dart';
class UserRepository{
  User user;

  Future<User> getUser() async{
    if(user != null) return user;
    return Future.delayed(
      const Duration(milliseconds: 300),
        ()=> user = User(Uuid().v4())
    );
  }
}
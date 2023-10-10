import 'package:workshop_client/workshop_client.dart';

abstract class UserRepo {
  Future<Users> login(String username, String password);

  Future<Users> register(Users user);
}

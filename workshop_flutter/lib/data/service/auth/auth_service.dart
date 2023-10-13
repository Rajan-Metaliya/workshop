import 'package:workshop_client/workshop_client.dart';

abstract class AuthService {
  Users get user;

  Future<void> setUser(Users user);

  Future<void> removeUser();
}

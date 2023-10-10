import 'package:workshop_client/workshop_client.dart';
import 'package:workshop_flutter/data/repo/user/user_repo.dart';

class UserRepoImpl extends UserRepo {
  @override
  Future<Users> login(String username, String password) async {
    await Future.delayed(const Duration(seconds: 2));

    return Users(
      id: 1,
      password: password,
      name: username,
      email: '$username@example.com',
      token: '',
    );
  }

  @override
  Future<Users> register(Users user) async {
    await Future.delayed(const Duration(seconds: 2));

    return Users(
      id: 1,
      password: user.password,
      name: user.name,
      email: user.email,
      token: '',
    );
  }
}

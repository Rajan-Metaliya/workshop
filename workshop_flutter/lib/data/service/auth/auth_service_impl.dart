import 'package:workshop_client/workshop_client.dart';

import 'auth_service.dart';

class AuthServiceImpl extends AuthService {
  Users _user =
      Users(email: '', name: '', id: 0, token: '', user_id: '', password: '');

  @override
  Users get user => _user;

  @override
  Future<void> removeUser() async {
    _user =
        Users(email: '', name: '', id: 0, token: '', user_id: '', password: '');
  }

  @override
  Future<void> setUser(Users user) async {
    _user = user;
  }
}

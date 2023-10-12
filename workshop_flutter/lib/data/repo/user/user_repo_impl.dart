import 'package:workshop_client/workshop_client.dart';

import '../../../utils/exceptions/exceptions.dart';
import '../../service/service.dart';
import 'user_repo.dart';

class UserRepoImpl extends UserRepo {
  @override
  Future<Users?> login(String username, String password) async {
    try {
      final response = await apiServer.client.user
          .getUserWithEmailPassword(email: username, password: password);

      if (response.data != null) {
        return response.data;
      } else {
        throw RepoException(message: response.message);
      }
    } catch (e) {
      throw RepoException(message: e.toString());
    }
  }

  @override
  Future<Users?> register(Users user) async {
    try {
      final response = await apiServer.client.user.addUser(user);

      if (response.data != null) {
        return response.data;
      } else {
        throw RepoException(message: response.message);
      }
    } catch (e) {
      throw RepoException(message: e.toString());
    }
  }
}

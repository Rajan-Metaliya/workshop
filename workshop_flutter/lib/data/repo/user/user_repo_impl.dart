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

      if (response != null) {
        return response;
      } else {
        throw RepoException(message: "Response is null");
      }
    } catch (e) {
      throw RepoException(message: e.toString());
    }
  }

  @override
  Future<Users?> register(Users user) async {
    try {
      final response = await apiServer.client.user.addUser(user);

      return response;
    } catch (e) {
      throw RepoException(message: e.toString());
    }
  }
}

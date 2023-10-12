import 'package:serverpod/server.dart';
import 'package:workshop_client/workshop_client.dart' show AppResponse;
import 'package:workshop_server/src/generated/protocol.dart';

class UserEndpoint extends Endpoint {
  Future<AppResponse<Users?>> getUserWithEmailPassword(
    Session session, {
    required String email,
    required String password,
  }) async {
    try {
      Users? user = await Users.findSingleRow(
        session,
        where: (t) => t.email.equals(email) & t.password.equals(password),
      );
      if (user == null) {
        return AppResponse.notFound("User not found");
      }

      return AppResponse<Users>(
        statusCode: 200,
        data: user,
        message: "User found",
      );
    } catch (e) {
      return AppResponse.error(e.toString());
    }
  }

  Future<AppResponse<Users>> addUser(Session session, Users user) async {
    try {
      await Users.insert(session, user);
      return AppResponse(
        statusCode: 200,
        message: "User added",
        data: user,
      );
    } catch (e) {
      return AppResponse.error(e.toString());
    }
  }

  Future<AppResponse<Users>> updateUser(Session session, Users user) async {
    try {
      await Users.insert(session, user);
      return AppResponse(
        statusCode: 200,
        message: "user updated",
        data: user,
      );
    } catch (e) {
      return AppResponse.error(e.toString());
    }
  }
}

import 'package:serverpod/server.dart';
import 'package:workshop_server/src/generated/protocol.dart';
import 'package:workshop_client/workshop_client.dart' show Response;

class UserEndpoint extends Endpoint {
  Future<Response<Users>?> getUserWithEmailPassword(
    Session session, {
    required String email,
    required String password,
  }) async {
    final user = await Users.findSingleRow(
      session,
      where: (t) => t.email.equals(email) & t.password.equals(password),
    );
    if (user == null) {
      return Response<Users>(
        statusCode: 404,
        error: 'User not found',
        message: "User not found"
      );
    }
    return Response<Users>(
      statusCode: 200,
      data: user,
      message: "User found"
    );
  }

  Future<bool> addUser(Session session, Users user) async {
    await Users.insert(session, user);
    return true;
  }

  Future<bool> updateUser(Session session, Users user) async {
    await Users.update(session, user);
    return true;
  }
}

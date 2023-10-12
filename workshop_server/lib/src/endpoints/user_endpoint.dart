import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
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

  // update user token

  Future<bool> _updateUserToken(Session session, Users user) async {
    try {
      await Users.update(
        session,
        user,
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  // generate Token

  Future<String> _generateToken(Users user) async {
    final jwt = JWT(
      user.toJson(),
      issuer: 'https://github.com/jonasroussel/dart_jsonwebtoken',
    );

// Sign it (default with HS256 algorithm)
    final token = jwt.sign(SecretKey('secret'));
    return token;
  }
}

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:serverpod/server.dart';
import 'package:workshop_client/workshop_client.dart' show Response;
import 'package:workshop_server/src/generated/protocol.dart';

class UserEndpoint extends Endpoint {
  Future<Response<Users>?> getUserWithEmailPassword(
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
        return Response.notFound("User not found");
      }

      return Response<Users>(
        statusCode: 200,
        data: user,
        message: "User found",
      );
    } catch (e) {
      return Response.error(e.toString());
    }
  }

  Future<Response> addUser(Session session, Users user) async {
    try {
      await Users.insert(session, user);
      return Response(
        statusCode: 200,
        message: "User added",
      );
    } catch (e) {
      return Response.error(e.toString());
    }
  }

  Future<Response> updateUser(Session session, Users user) async {
    try {
      await Users.insert(session, user);
      return Response(
        statusCode: 200,
        message: "user updated",
      );
    } catch (e) {
      return Response.error(e.toString());
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

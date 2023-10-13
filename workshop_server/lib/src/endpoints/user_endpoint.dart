import 'package:serverpod/server.dart';
import 'package:workshop_server/src/generated/protocol.dart';

class UserEndpoint extends Endpoint {
  Future<Users?> getUserWithEmailPassword(
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
        throw Exception("User not found");
      }

      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<Users> addUser(Session session, Users user) async {
    try {
      // Check if user already exists
      Users? existingUser = await Users.findSingleRow(
        session,
        where: (t) => t.email.equals(user.email),
      );

      if (existingUser != null) {
        throw Exception("User already exists");
      }

      await Users.insert(session, user);
      return user;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Users> updateUser(Session session, Users user) async {
    try {
      await Users.insert(session, user);
      return user;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

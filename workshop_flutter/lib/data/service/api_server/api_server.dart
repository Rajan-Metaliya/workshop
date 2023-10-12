import 'package:workshop_client/workshop_client.dart';

abstract class ApiServer {
  Client get client;

  Future<void> init({required String baseUrl});
}

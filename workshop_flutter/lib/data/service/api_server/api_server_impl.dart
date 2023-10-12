import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:workshop_client/workshop_client.dart';

import 'api_server.dart';

class ApiServerImpl extends ApiServer {
  late Client _client;

  @override
  // TODO: implement client
  Client get client => _client;

  @override
  Future<void> init({required String baseUrl}) async {
    _client = Client(baseUrl)
      ..connectivityMonitor = FlutterConnectivityMonitor();
  }
}

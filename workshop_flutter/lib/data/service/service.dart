import 'package:get_it/get_it.dart';

import 'api_server/api_server.dart';
import 'api_server/api_server_impl.dart';
import 'auth/auth_service.dart';
import 'auth/auth_service_impl.dart';

final getIt = GetIt.instance;
void initService() {
  getIt.registerLazySingleton<ApiServer>(() => ApiServerImpl());
  getIt.registerLazySingleton<AuthService>(() => AuthServiceImpl());
}

ApiServer get apiServer => getIt.get<ApiServer>();

AuthService get authService => getIt.get<AuthService>();

import 'package:get_it/get_it.dart';

import 'api_server/api_server.dart';
import 'api_server/api_server_impl.dart';

final getIt = GetIt.instance;
void initService() {
  getIt.registerLazySingleton<ApiServer>(() => ApiServerImpl());
}

ApiServer get apiServer => getIt.get<ApiServer>();

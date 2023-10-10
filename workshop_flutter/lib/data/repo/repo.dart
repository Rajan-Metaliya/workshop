import 'package:get_it/get_it.dart';
import 'package:workshop_flutter/data/repo/cart/cart_repo.dart';
import 'package:workshop_flutter/data/repo/cart/cart_repo_impl.dart';
import 'package:workshop_flutter/data/repo/product/product_repo.dart';
import 'package:workshop_flutter/data/repo/product/product_repo_impl.dart';
import 'package:workshop_flutter/data/repo/user/user_repo.dart';
import 'package:workshop_flutter/data/repo/user/user_repo_impl.dart';

final getIt = GetIt.instance;

initRepo() {
  getIt.registerLazySingleton<CartRepo>(() => CartRepoImpl());
  getIt.registerLazySingleton<ProductRepo>(() => ProductRepoImpl());
  getIt.registerLazySingleton<UserRepo>(() => UserRepoImpl());
}

CartRepo get cartRepo => getIt.get<CartRepo>();

ProductRepo get productRepo => getIt.get<ProductRepo>();

UserRepo get userRepo => getIt.get<UserRepo>();

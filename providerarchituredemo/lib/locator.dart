import 'package:get_it/get_it.dart';
import 'package:providerarchituredemo/core/services/api.dart';
import 'package:providerarchituredemo/core/services/authentication_service.dart';
import 'package:providerarchituredemo/core/viewmodels/comments_model.dart';
import 'package:providerarchituredemo/core/viewmodels/home_model.dart';
import 'package:providerarchituredemo/core/viewmodels/login_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => Api());

  locator.registerFactory(() => LoginModel());
  locator.registerFactory(() => HomeModel());
  locator.registerFactory(() => CommentsModel());
}

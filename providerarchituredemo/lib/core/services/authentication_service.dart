import 'dart:async';
import 'package:providerarchituredemo/core/models/user.dart';
import 'package:providerarchituredemo/core/services/api.dart';
import 'package:providerarchituredemo/locator.dart';

class AuthenticationService {
  Api _api = locator<Api>();

  StreamController<User> userController = StreamController<User>();

  Future<bool> login(int userId) async {
    final fetchedUser = await _api.getUserProfile(userId);
    final hasUser = fetchedUser != null;
    if (hasUser) {
      userController.add(fetchedUser);
    }
    return hasUser;
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerarchituredemo/core/models/user.dart';
import 'package:providerarchituredemo/locator.dart';
import 'package:providerarchituredemo/ui/app_router.dart';
import 'core/services/authentication_service.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>(
      initialData: User.initial(),
      create: (BuildContext context) =>
          locator<AuthenticationService>().userController.stream,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(),
        initialRoute: 'login',
        onGenerateRoute: AppRoute.generateRoute,
      ),
    );
  }
}

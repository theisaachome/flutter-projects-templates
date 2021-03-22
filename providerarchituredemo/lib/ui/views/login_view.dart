import 'package:flutter/material.dart';
import 'package:providerarchituredemo/core/enums/viewstate.dart';
import 'package:providerarchituredemo/core/viewmodels/login_model.dart';
import 'package:providerarchituredemo/ui/shared/app_colors.dart';
import 'package:providerarchituredemo/ui/views/base_view.dart';
import 'package:providerarchituredemo/ui/widgets/login_header.dart';

class LoginView extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginModel>(
      builder: (context, model, child) => Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoginHeader(
                controller: _controller, validationMessage: model.errorMessage),
            model.state == ViewState.Busy
                ? CircularProgressIndicator()
                : TextButton(
                    onPressed: () async {
                      var loginSuccess = await model.login(_controller.text);
                      if (loginSuccess) {
                        Navigator.pushNamed(context, '/');
                      }
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.black),
                    ))
          ],
        ),
      ),
    );
  }
}

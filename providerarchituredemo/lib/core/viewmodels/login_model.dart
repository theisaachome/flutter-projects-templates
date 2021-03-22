import 'package:providerarchituredemo/core/enums/viewstate.dart';
import 'package:providerarchituredemo/core/services/authentication_service.dart';
import 'package:providerarchituredemo/core/viewmodels/based_model.dart';
import 'package:providerarchituredemo/locator.dart';

class LoginModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  String errorMessage;

  Future<bool> login(String userIdText) async {
    setState(ViewState.Busy);

    final userId = int.tryParse(userIdText);

    // if Not A Number
    if (userId == null) {
      errorMessage = 'Value enter is not a number';
      setState(ViewState.Idle);
      return false;
    }

    final success = await _authenticationService.login(userId);

    // Handle potential Error here too
    setState(ViewState.Idle);

    return success;
  }
}

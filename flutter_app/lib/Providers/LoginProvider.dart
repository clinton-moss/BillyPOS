import 'package:flutter/material.dart';
import 'package:pos/Helpers/APIClient.dart';
import 'package:pos/Helpers/Loader.dart';
import 'package:pos/Models/Auth/Loginresponse.dart';

class LoginProvider with ChangeNotifier implements LoaderState {
  APIClient apiClient = new APIClient();
  LoginProvider() {
    setState(ViewState.Idle);
  }

  // ValidationModel _email = ValidationModel(null, null);
  // ValidationModel _password = ValidationModel(null, null);

  String _email = "";
  String _password = "";

  get email => _email;
  get password => _password;

  // //Getters
  // ValidationModel get email => _email;
  // ValidationModel get password => _password;

  bool get isValid {
    return true;
    // if (_password.value != null && _email.value != null) {
    //   return true;
    // } else {
    //   return false;
    // }
  }

  //Setters
  void changeEmail(String value) {
    _email = value;
    // if (ValidatorType.email.hasMatch(value)) {
    //   _email = ValidationModel(value, null);
    // } else
    if (value.isEmpty) {
      // _email = ValidationModel(null, null);
    }
    // else {
    //   _email = ValidationModel(null, "Enter a valid email");
    // }

    notifyListeners();
  }

  void changePassword(String value) {
    _password = value;
    // if (ValidatorType.password.hasMatch(value)) {
    //   _password = ValidationModel(value, null);
    // } else
    if (value.isEmpty) {
      // _password = ValidationModel(null, null);
    }
    //  else {
    //   _password = ValidationModel(null, "Must have at least 8 characters");
    // }
    notifyListeners();
  }

  late ViewState _state;

  @override
  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  @override
  ViewState get state => _state;

  Future<LoginResponse> submitLogin() async {
    LoginResponse? response = new LoginResponse();
    setState(ViewState.Busy);
    try {
      response = await apiClient.login(
        // _email.value,
        // _password.value,
        _email,
        _password,
      );
    } catch (e) {
      setState(ViewState.Idle);
      throw e;
    }
    setState(ViewState.Idle);
    if (response is LoginResponse) {
      print('response.token ${response.token}');
    } else {
      throw Exception("Login Failed");
    }
    return response;
  }

  @override
  void dispose() {
    super.dispose();
  }
}

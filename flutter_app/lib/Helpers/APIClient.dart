import 'dart:convert';

import 'package:pos/Config/Config.dart';
import 'package:pos/Models/Auth/Loginresponse.dart';
import 'package:http/http.dart' as http;

class APIClient {
  Future<LoginResponse?> login(String? username, String? password) async {
//
    LoginResponse? response;
    try {
      var res = await http.post(
          Uri.parse(Configuration.billyCoreAPI + "/authenticate"),
          body: json
              .encode({"username": username, "password": password}).toString(),
          headers: {"content-type": "application/json"});
      if (res.statusCode == 200) {
        response = LoginResponse.fromJson(res.body);
      }
    } catch (e) {
      throw e;
    }
    return response;
  }
}

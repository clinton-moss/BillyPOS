import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pos/Config/Config.dart';

import 'package:http/http.dart' as http;
import 'package:pos/main.dart';

import 'HomeScreen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Log In")),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            ElevatedButton(
              onPressed: () async {
                var username = _usernameController.text;
                var password = _passwordController.text;

                var jwt = await attemptLogIn(username, password);
                if (jwt != null) {
                  storage.write(key: "jwt", value: jwt);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeScreen.fromBase64(jwt)));
                } else {
                  displayDialog(context, "An Error Occurred",
                      "No account was found matching that username and password");
                }
              },
              child: Text("Log In"),
            ),
          ],
        ),
      ),
    );
  }

  void displayDialog(BuildContext context, String title, String text) =>
      showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(title: Text(title), content: Text(text)),
      );

  Future<String> attemptLogIn(String username, String password) async {
    var res = await http.post(
        Uri.parse(Configuration.billyCoreAPI + "/authenticate"),
        body: json
            .encode({"username": username, "password": password}).toString(),
        headers: {"content-type": "application/json"});
    if (res.statusCode == 200) return res.body;
    return null;
  }
}

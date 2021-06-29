import 'package:flutter/material.dart';

import 'package:pos/Helpers/Loader.dart';
import 'package:pos/Models/Auth/Loginresponse.dart';
import 'package:pos/Providers/LoginProvider.dart';
import 'package:provider/provider.dart';

import 'HomeScreen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          // Email Field
          Consumer<LoginProvider>(builder: (context, provider, child) {
            return TextField(
              decoration: InputDecoration(
                labelText: "Username",
                // errorText: provider.email.error,
              ),
              onChanged: (String value) {
                provider.changeEmail(value);
              },
            );
          }),

          // Password Field
          Consumer<LoginProvider>(builder: (context, provider, child) {
            return TextField(
              decoration: InputDecoration(
                labelText: "Password",
                // errorText: provider.password.error,
              ),
              onChanged: (String value) {
                provider.changePassword(value);
              },
            );
          }),

          //Update Indicator
          Consumer<LoginProvider>(builder: (context, provider, child) {
            return Container(
              height: 150,
              child: Center(
                child: provider.state == ViewState.Idle
                    ? Container()
                    : CircularProgressIndicator(),
              ),
            );
          }),

          //Submit button will be enabled on correct format of email and password
          Consumer<LoginProvider>(builder: (context, provider, child) {
            return ElevatedButton(
              // color: Colors.blue,
              // disabledColor: Colors.grey,
              child: Text(
                'Submit',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: (!provider.isValid)
                  ? null
                  : () {
                      provider.submitLogin().then((LoginResponse response) {
                        print('response: ${response.token} ');

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      }).onError((error, stackTrace) {
                        //
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                                  content: Text(
                                      (error == null) ? "" : error.toString()),
                                ));
                      });
                    },
            );
          })
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pos/Screens/StandbyScreen.dart';
import 'package:pos/Widgets/input/NumberKeyboard.dart';

class HomeScreen extends StatelessWidget {
  // HomeScreen(this.jwt, this.payload);

  // factory HomeScreen.fromBase64(String jwt) => HomeScreen(
  //     jwt,
  //     json.decode(
  //         ascii.decode(base64.decode(base64.normalize(jwt.split(".")[1])))));

  // final String jwt;
  // final Map<String, dynamic> payload;

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: Text("Billy - POS")),
      body: Column(
        children: [
          Text('Please enter your employee code'),
          Text('*  *  *  *'),
          NumberKeyboard(
            onComplete: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (builder) => StandbyScreen()));
            },
          ),
        ],
      ));
}

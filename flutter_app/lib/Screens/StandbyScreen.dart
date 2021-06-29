import 'package:flutter/material.dart';
import 'package:pos/Screens/SaleScreen.dart';

class StandbyScreen extends StatefulWidget {
  const StandbyScreen({Key? key}) : super(key: key);

  @override
  _StandbyScreenState createState() => _StandbyScreenState();
}

class _StandbyScreenState extends State<StandbyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (builder) => SaleScreen()));
            },
            child: Text('New Order'),
          ),
        ],
      ),
    );
  }
}

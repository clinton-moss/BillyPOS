import 'package:flutter/material.dart';

class SaleScreen extends StatefulWidget {
  const SaleScreen({Key? key}) : super(key: key);

  @override
  _SaleScreenState createState() => _SaleScreenState();
}

class _SaleScreenState extends State<SaleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text('Find'),
              )
            ],
          ),
          Text('Product SKU'),
          TextField(
              // Add Scan Option
              ),
        ],
      ),
    );
  }
}

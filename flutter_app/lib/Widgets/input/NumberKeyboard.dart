import 'package:flutter/material.dart';

class NumberKeyboard extends StatefulWidget {
  final Function? onComplete;
  const NumberKeyboard({Key? key, this.onComplete}) : super(key: key);

  @override
  _NumberKeyboardState createState() => _NumberKeyboardState();
}

class _NumberKeyboardState extends State<NumberKeyboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () {}, child: Text('0')),
              ElevatedButton(onPressed: () {}, child: Text('1')),
              ElevatedButton(onPressed: () {}, child: Text('2')),
              ElevatedButton(onPressed: () {}, child: Text('3')),
              ElevatedButton(onPressed: () {}, child: Text('4')),
              ElevatedButton(onPressed: () {}, child: Text('5')),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () {}, child: Text('6')),
              ElevatedButton(onPressed: () {}, child: Text('7')),
              ElevatedButton(onPressed: () {}, child: Text('8')),
              ElevatedButton(onPressed: () {}, child: Text('9')),
              ElevatedButton(onPressed: () {}, child: Text('<')),
              ElevatedButton(
                onPressed: () {
                  print("ENTER");
                  widget.onComplete!();
                },
                child: Text('E'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

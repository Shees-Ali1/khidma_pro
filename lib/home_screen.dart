import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khidma_pro/widgets/buttons.dart';

import 'consts/text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text('Start of Khidma Prooooo',style: TextStyle(fontWeight: FontWeight.w700,fontSize:25 ),),
          ),
          CustomText(
            text: 'Hello, Flutter!',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
            textAlign: TextAlign.center,
          ),
          CustomButton(
            text: "Click Me",
            onPressed: () {
              print("Button Pressed");
            },
            width: 200, // Optional
            color: Colors.green, // Custom color
            textColor: Colors.white, // Custom text color
          )

        ],
      ),
    );
  }
}

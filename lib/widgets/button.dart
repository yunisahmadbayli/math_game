import "package:flutter/material.dart";
import 'package:math_game/assets/style.dart';

class Button extends StatelessWidget {

  final String text;
  final VoidCallback onTap  ;
  var buttonColor = Colors.deepPurple[600];
  
  Button({super.key, required this.text,required this.onTap});

  @override
  Widget build(BuildContext context) {
    if(text == "C"){
      buttonColor = Colors.red;
    }else if(text =="DEL"){
      buttonColor = Colors.green ;
    }else if(text == "="){
      buttonColor = Colors.deepPurple;
    }
    
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: buttonColor, borderRadius: BorderRadius.circular(12)),
          child: Center(
              child: Text(
            text,
            style: textStyle,
          )),
        ),
      ),
    );
  }
}

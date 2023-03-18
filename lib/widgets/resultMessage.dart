import "package:flutter/material.dart";
import "../assets/style.dart";

class ResultMessage extends StatelessWidget {

  final String message ; 
  final VoidCallback onTap ;
  final icon ;

  const ResultMessage({super.key,required this.message,required this.onTap,required this.icon});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepPurple,
      content: Container(
        width: 120,
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              message,
              style: textStyle,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.deepPurple[400],
                  borderRadius: BorderRadius.circular(12)),
              child: IconButton(
                  onPressed: onTap,
                  icon: Icon(
                    icon,
                    color: Colors.white,
                    size: 36,
                  )),
            )
          ],
        ),
      ),
    );
  }
}


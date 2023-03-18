import 'dart:math';

import "package:flutter/material.dart";
import 'package:math_game/widgets/resultMessage.dart';
import "../assets/style.dart";
import "../widgets/button.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int numA = 1 ;
  int numB = 1 ;
  List<String> numberList = [
    "7","8","9","C","4","5","6","DEL","1","2","3","=","0"
  ];
  String userAnswer = ""; 

  void buttonTapped(String button){
    setState(() {
      if(button == "="){
        checkResult();
      }
      else if(button == "DEL"){
        if(userAnswer.isNotEmpty){
          userAnswer = userAnswer.substring(0,userAnswer.length - 1);
        }
      }
      else if(button == "C"){
        userAnswer = "";
      }
      else {
        userAnswer += button;
      }
    });
  }

  void checkResult(){
    if(numA + numB == int.parse(userAnswer)){
      showDialog(
        context: context,
        builder: (context){
          return ResultMessage(message: "Correct", onTap: nextQuestion, icon: Icons.arrow_forward);
        }
      );
    }else {
      showDialog(
        context: context,
        builder: (context){
          return ResultMessage(message: "Incorrect, try again ", onTap: backQuestion, icon: Icons.rotate_left);
        }
      );
    }
  }

  var randomNumber = Random();

  void nextQuestion(){
    Navigator.of(context).pop();
    setState(() {
      userAnswer = "";
    });

    numA = randomNumber.nextInt(10);
    numB = randomNumber.nextInt(10);
  }
  void backQuestion(){
    Navigator.of(context).pop();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[300],
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 110,
              color: Colors.deepPurple,
              child: Center(
                child : Text("Math Game",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 32,color: Colors.white),)
              ),
            ),
            Expanded(
              child: Container(
                child: Center(
                  child :Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(numA.toString() + " + " +  numB.toString() + " = ",style: textStyle,),
                      Container(
                        height: 50,
                        width: 90,
                        decoration: BoxDecoration(
                          color: Colors.deepPurple[400],
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: Center(
                          child : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(userAnswer,style: textStyle,maxLines: 1,),
                          )
                        ),
                      )
                    ],
                  )
                ),
              )
            ),
            Expanded(
              flex: 3,
              child: GridView.builder(
                itemCount: numberList.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (context,index){
                  return Button(text: numberList[index],onTap: () => buttonTapped(numberList[index]),);
                },
              )
            )
          ],
        ),
      ),
    );
  }
}
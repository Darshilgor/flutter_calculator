// import 'dart:ffi';

// import 'dart:html';

import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculatorr extends StatefulWidget {
  const Calculatorr({super.key});
  @override
  State<Calculatorr> createState() => CalculatorrState();
}

class CalculatorrState extends State<Calculatorr> {
  String useranswer = '0';
  String userquestion = '0';
  userQuestion(String buttonText) {
    setState(() {
      // userquestion += buttonText;
      if (buttonText == 'C') {
        userquestion = '0';
      } else if (buttonText == 'DEL') {
        userquestion = userquestion.substring(0, userquestion.length - 1);
      } else if (buttonText == '=') {
        var expression = userquestion;
        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();
          useranswer = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (error) 
        { 
          print(error);
        }
      } else if (buttonText == 'ANS') {
        userquestion = useranswer;
      } else if (buttonText == '0') {
        if (userquestion == '') {
          userquestion = '';
        }
      } else {
        if (userquestion == '0') {
          userquestion = '';
        }
        userquestion += buttonText;
      }
    });
  }

  Widget buildButton(String buttonText, Color buttonColor, Color textColor,
      double buttonHeight) {
    // buildButton({super.key,required this.buttonText,required this.buttonColor,required this.textColor} as String);
    return GestureDetector(
      onTap: () {
        userQuestion(buttonText);
      },
      // onTap: buttonTapped,
      child: Container(
        height: MediaQuery.of(context).size.height * buttonHeight,
        // color: Colors.deepPurple[100],
        decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(8),
            shape: BoxShape.rectangle,
            border: Border.all(
                width: 1, color: Colors.black, style: BorderStyle.solid)),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 25, color: textColor),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // String userquestion = 'userquestion';
    // String useranswer = 'useranswer';
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepPurple[200],
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 50, left: 10),
                      child: Text(
                        // textAlign: TextAlign.start,
                        userquestion,
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    SizedBox(
                      height: 110,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 100, right: 10),
                      child: Text(
                        // textAlign: TextAlign.start,
                        useranswer,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Table(
                    children: [
                      TableRow(
                        // buildButton(),
                        children: [
                          buildButton(
                              "C", Colors.deepPurple[100]!, Colors.white, 0.11),
                          buildButton("DEL", Colors.deepPurple[100]!,
                              Colors.white, 0.11),
                          buildButton(
                              "/", Colors.deepPurple[100]!, Colors.white, 0.11),
                        ],
                      ),
                      TableRow(
                        // buildButton(),
                        children: [
                          buildButton(
                              "7", Colors.deepPurple[100]!, Colors.white, 0.11),
                          buildButton(
                              "8", Colors.deepPurple[100]!, Colors.white, 0.11),
                          buildButton(
                              "9", Colors.deepPurple[100]!, Colors.white, 0.11),
                        ],
                      ),
                      TableRow(
                        // buildButton(),
                        children: [
                          buildButton(
                              "4", Colors.deepPurple[100]!, Colors.white, 0.11),
                          buildButton(
                              "5", Colors.deepPurple[100]!, Colors.white, 0.11),
                          buildButton(
                              "6", Colors.deepPurple[100]!, Colors.white, 0.11),
                        ],
                      ),
                      TableRow(
                        // buildButton(),
                        children: [
                          buildButton(
                              "1", Colors.deepPurple[100]!, Colors.white, 0.11),
                          buildButton(
                              "2", Colors.deepPurple[100]!, Colors.white, 0.11),
                          buildButton(
                              "3", Colors.deepPurple[100]!, Colors.white, 0.11),
                        ],
                      ),
                      TableRow(
                        // buildButton(),
                        children: [
                          buildButton(
                              ".", Colors.deepPurple[100]!, Colors.white, 0.11),
                          buildButton(
                              "0", Colors.deepPurple[100]!, Colors.white, 0.11),
                          buildButton("ANS", Colors.deepPurple[100]!,
                              Colors.white, 0.11),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: Table(
                          children: [
                            TableRow(
                              children: [
                                buildButton("*", Colors.deepPurple[100]!,
                                    Colors.white, 0.11),
                                // buildButton(".", Colors.deepPurple[100]!, Colors.white),
                                // buildButton(".", Colors.deepPurple[100]!, Colors.white),
                                // buildButton(".", Colors.deepPurple[100]!, Colors.white),
                              ],
                            ),
                            TableRow(
                              children: [
                                buildButton("-", Colors.deepPurple[100]!,
                                    Colors.white, 0.11),
                                // buildButton(".", Colors.deepPurple[100]!, Colors.white),
                                // buildButton(".", Colors.deepPurple[100]!, Colors.white),
                                // buildButton(".", Colors.deepPurple[100]!, Colors.white),
                              ],
                            ),
                            TableRow(
                              children: [
                                buildButton("+", Colors.deepPurple[100]!,
                                    Colors.white, 0.11),
                                // buildButton(".", Colors.deepPurple[100]!, Colors.white),
                                // buildButton(".", Colors.deepPurple[100]!, Colors.white),
                                // buildButton(".", Colors.deepPurple[100]!, Colors.white),
                              ],
                            ),
                            TableRow(
                              children: [
                                buildButton("=", Colors.deepPurple[100]!,
                                    Colors.white, 0.221),
                                // buildButton(".", Colors.deepPurple[100]!, Colors.white),
                                // buildButton(".", Colors.deepPurple[100]!, Colors.white),
                                // buildButton(".", Colors.deepPurple[100]!, Colors.white),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            // Column(
            //   // crossAxisAlignment: CrossAxisAlignment.end,
            //   // mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     Align(
            //       alignment: Alignment.topRight,
            //       child: Container(
            //         width: MediaQuery.of(context).size.width * 0.25,
            //         child: Table(
            //           children: [
            //             TableRow(
            //               children: [
            //                 buildButton(
            //                     ".", Colors.deepPurple[100]!, Colors.white),
            //                 // buildButton(".", Colors.deepPurple[100]!, Colors.white),
            //                 // buildButton(".", Colors.deepPurple[100]!, Colors.white),
            //                 // buildButton(".", Colors.deepPurple[100]!, Colors.white),
            //               ],
            //             ),
            //             TableRow(
            //               children: [
            //                 buildButton(
            //                     ".", Colors.deepPurple[100]!, Colors.white),
            //                 // buildButton(".", Colors.deepPurple[100]!, Colors.white),
            //                 // buildButton(".", Colors.deepPurple[100]!, Colors.white),
            //                 // buildButton(".", Colors.deepPurple[100]!, Colors.white),
            //               ],
            //             )
            //           ],
            //         ),
            //       ),
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }

  // buttonTapped() {}

  // buildButton() {

  // }
}

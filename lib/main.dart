import 'package:flutter/material.dart';
import 'master_question.dart';
// import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(MyApp());
}

MasterQuestion masterQuestion = MasterQuestion();

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  Icon widgetAnswer(bool answer) {
    return Icon(
      answer ? Icons.check : Icons.close,
      color: answer ? Colors.green : Colors.red,
    );
  }

  // showAlertCustom(context) {
  //   Alert(
  //     context: context,
  //     title: "RFLUTTER ALERT",
  //     desc: "Flutter is better with RFlutter Alert.",
  //   ).show();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 100, 20, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Text(
                    masterQuestion.isFinished()
                        ? masterQuestion.getPoint().toString()
                        : masterQuestion.getQuestion(),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                masterQuestion.submitAnswer(true);
                                // showAlertCustom(context);
                              });
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.green,
                            ),
                            child: Text(
                              'True',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                masterQuestion.submitAnswer(false);
                              });
                            },
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.red),
                            child: Text(
                              'False',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          masterQuestion.resetQuestion();
                        });
                      },
                      child: Text(
                        'Reset',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Row(
                      children: masterQuestion
                          .getUserAnswer()
                          .map((e) => widgetAnswer(e))
                          .toList(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

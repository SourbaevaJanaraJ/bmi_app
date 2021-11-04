import 'package:bmi_app/bottom_button.dart';
import 'package:bmi_app/constants.dart';
import 'package:bmi_app/reusablecard.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;
  const ResultPage({
     @required this.bmiResult,
      @required this.resultText,
      @required this.interpretation});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('bmi calculator'.toUpperCase(),
        ),
  ),
  body: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: <Widget>[
      Expanded(
        flex: 1,
        child: Container(
        padding: EdgeInsets.all(15.0),
        alignment: Alignment.bottomLeft,
        child: Text('Your Result', style: kTitleTextStyle,
        ),
        ),
        ),
        Expanded(
          flex: 5,
          child: ReusableCard(
            bgColor: kActiveCardColour,
            child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  resultText, style: kResultTextStyle,
                ),
                Text(
                  bmiResult, style: bMITextStyle,
                ),
              ],
            ),
          ),
          ),
          BottomButton(
            onTap: () {
              Navigator.pop(context);
            }, 
            buttonTitle: 're-calculate'.toUpperCase()
            ),
    ],
  ),
    );
  }
}
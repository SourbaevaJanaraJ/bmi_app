import 'package:bmi_app/constants/app_textstyles.dart';
import 'package:bmi_app/constants/constants.dart';
import 'package:bmi_app/widgets/bottom_button.dart';

import 'package:bmi_app/widgets/reusablecard.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;
  const ResultScreen({
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
        padding: const EdgeInsets.all(15.0),
        alignment: Alignment.bottomLeft,
        child: Text('Your Result', style: AppTextstyles.kTitleTextStyle,
        ),
        ),
        ),
        Expanded(
          flex: 5,
          child: ReusableCard(
            bgColor: AppColors.kActiveCardColour,
            child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  resultText, style:  AppTextstyles.kResultTextStyle,
                ),
                Text(
                  bmiResult, style:  AppTextstyles.bMITextStyle,
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
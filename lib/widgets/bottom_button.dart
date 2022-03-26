import 'package:bmi_app/constants/app_textstyles.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';

class BottomButton extends StatelessWidget {
   BottomButton({
     @required this.onTap,
     @required this.buttonTitle
     });

  final Function onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style:  AppTextstyles.kLargeButtonTextStyle,
          ),
        ),
        color: AppColors.kBottomContainerColour,
        margin: const EdgeInsets.only(top: 10.0),
        padding: const EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}
import 'package:bmi_app/constants/constants.dart';
import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  
  final IconData icon;
  final Function onPressed;

   RoundIconButton({@required this.icon, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      elevation: 6.0,
      shape: Obx(() => const CircleBorder()),
      fillColor: AppColors.iconButtonFillColor,
      onPressed: onPressed,
      
    );
  }
}
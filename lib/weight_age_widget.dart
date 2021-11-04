import 'package:bmi_app/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';

class WeightAgeWidget extends StatelessWidget {
  final String text;
  final int number;
  final Function minus;
  final Function plus;
  final bool isKG;
  const WeightAgeWidget({
    @required this.text,
    @required this.number,
    @required this.minus,
    @required this.plus,
    this.isKG = false,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var roundIconButton = RoundIconButton;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text, style: sliderTextStyle,), 
      isKG 
      ?  Row(
          mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
          children: [
            Text(number.toString(), 
            style: sliderNoTextStyle,
            ),
            Text(' kg'),
          ],
        )
        : Text(number.toString(), 
            style: sliderNoTextStyle,
            ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundIconButton(
              onPressed: minus,
              icon: FontAwesomeIcons.minus,
              ),
              SizedBox(width: 10.0,),
              RoundIconButton(
              onPressed: plus,
              icon: FontAwesomeIcons.plus,
              ),
          ],
        ),
      ],
      
    );
  }
}

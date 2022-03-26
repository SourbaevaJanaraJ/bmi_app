import 'package:bmi_app/constants/app_textstyles.dart';
import 'package:bmi_app/widgets/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



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
        Text(text, style: AppTextstyles.sliderTextStyle,), 
      isKG 
      ?  Row(
          mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
          children: [
            Text(number.toString(), 
            style: AppTextstyles.sliderNoTextStyle,
            ),
            const Text(' kg'),
          ],
        )
        : Text(number.toString(), 
            style: AppTextstyles.sliderNoTextStyle,
            ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundIconButton(
              onPressed: minus,
              icon: FontAwesomeIcons.minus,
              ),
              const SizedBox(width: 10.0,),
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

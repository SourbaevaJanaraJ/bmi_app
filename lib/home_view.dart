
import 'package:bmi_app/bottom_button.dart';
import 'package:bmi_app/calculator_brain.dart';
import 'package:bmi_app/constants.dart';
import 'package:bmi_app/weight_age_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import 'result_page.dart';
import 'iconcontent.dart';
import 'reusablecard.dart';


class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
int height = 110; 
int weight = 40;
int age = 15;
Gender gender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Color(0xff0b0e21),
        title: Text('BMI Calculator'.toUpperCase()),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child:  ReusableCard(
                    onTap: () {
                      setState(() {
                        gender = Gender.male;
                      });
                    },
                    bgColor: gender == Gender.male
                    ? kActiveCardColour
                    : kInactiveCardColour,
                    child: const IconContent(
                      text: 'MALE',
                      icon: FontAwesomeIcons.mars,
                    ),
                ),
                ),
                  Expanded(
            child: ReusableCard(  
              onTap: (){
                setState(() {
                  gender = Gender.female;
                });
              },
              bgColor: gender == Gender.female
                    ? kActiveCardColour
                    : kInactiveCardColour,
              child:const IconContent(
                icon: FontAwesomeIcons.venus,
                text: 'FEMALE',
                ),
            ),
           ),
           ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              bgColor: cardBGColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT', 
                    style: sliderTextStyle,
                     ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: sliderNoTextStyle,
                      ),
                      Text(
                        'cm',
                      style: sliderTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 50.0,
                      max: 250.0,
                      onChanged: (value) {
                        setState(() {
                          height =value.toInt();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
         Expanded(
           child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    bgColor: cardBGColor,
                    child: WeightAgeWidget(
                      isKG: true,
                      minus: (){
                        weight--;
                        setState(() {});
                      },
                      
                      plus: (){
                        weight++;
                        setState(() {});
                      },
                      text: 'WEIGHT',
                      number: weight,
                    ),)
                  ),
                
                 Expanded(
            child: ReusableCard(
            bgColor: cardBGColor,
            child: WeightAgeWidget(
              minus: (){
                        age--;
                        setState(() {});
                      },
                      plus: (){
                        age++;
                        setState(() {});
                      },
              text: 'AGE',
              number: age,
            ),)
                  ),
              ],
            ),
         ),
         BottomButton(
           onTap: () {
             CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                            bmiResult: calc.calculateBMI(),
                            resultText: calc.getResult(),
                            interpretation: calc.getInterpretation(),
                          )));
           }, 
           buttonTitle: 'SEE RESULTS',
           ),
          ],
          ),
   );
  }
  }


enum Gender { male, female }

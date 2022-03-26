
import 'package:bmi_app/constants/app_textstyles.dart';
import 'package:bmi_app/constants/constants.dart';
import 'package:bmi_app/widgets/bottom_button.dart';
import 'package:bmi_app/repository/bmi_calculator_repo.dart';
import 'package:bmi_app/widgets/weight_age_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'result_screen.dart';
import '../widgets/icon_widget.dart';
import '../widgets/reusablecard.dart';


class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
int height = 110; 
int weight = 40;
int age = 15;
Gender gender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: AppColors.bGColor,
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
                    ? AppColors.kActiveCardColour
                    : AppColors.kInactiveCardColour,
                    child: const IconWidget(
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
                    ? AppColors.kActiveCardColour
                    : AppColors.kInactiveCardColour,
              child:const IconWidget(
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
              bgColor: AppColors.cardBGColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'HEIGHT', 
                    style: AppTextstyles.sliderTextStyle,
                     ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: AppTextstyles.sliderNoTextStyle,
                      ),
                      const Text(
                        'cm',
                      style: AppTextstyles.sliderTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: AppColors.thumbColor,
                      overlayColor: AppColors.overlayColor,
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 30.0),
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
                    bgColor: AppColors.cardBGColor,
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
            bgColor: AppColors.cardBGColor,
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
             BmiCalculatorRepo calc =
                  BmiCalculatorRepo(height: height, weight: weight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultScreen(
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

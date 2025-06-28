import 'package:bmi/bmi_calculator.dart';
import 'package:bmi/components/bottom_button.dart';
import 'package:bmi/components/icon_content.dart';
import 'package:bmi/screens/results_page.dart';
import 'package:bmi/components/reusable_card.dart';
import 'package:bmi/components/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';



enum  Gender{
  male,
  female
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height=160;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("BMI CALCULATOR"),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                        onPress: (){
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        },
                        colour: selectedGender == Gender.male ? activeCardColor:inactiveCardColor,
                        cardChild: IconContent(
                          icon: FontAwesomeIcons.mars,
                          label:"MALE"
                        )
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: selectedGender == Gender.female ? activeCardColor : inactiveCardColor ,
                      cardChild: IconContent(
                          icon: FontAwesomeIcons.venus,
                          label: "FEMALE"
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                  colour: activeCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "HEIGHT",
                        style: labelStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                              height.toString(),
                              style: kNumberStyle,
                          ),
                          Text(
                              "cm",
                              style: labelStyle,
                          )
                        ]
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Color(0xFF8D8E98),
                          thumbColor: Color(0xFFEB1555),
                          overlayColor: Color(0x23EB1555),
                          overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0)
                        ),
                        child: Slider(
                            value: height.toDouble(),
                            min:120,
                            max:220,
                            onChanged: (double newValue){
                              setState(() {
                                height = newValue.round();
                              });
                            }
                        ),
                      )
                    ],
                  ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                        colour: activeCardColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("WEIGHT",
                            style: labelStyle,),
                            Text(weight.toString(),
                            style:kNumberStyle),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               RoundedButton(
                                 icon: FontAwesomeIcons.minus,
                                 onPressed: (){
                                   setState(() {
                                     weight--;
                                   });

                                 },
                               ),
                               SizedBox(width: 10.0),
                               RoundedButton(
                                 icon: FontAwesomeIcons.plus,
                                 onPressed: (){
                                   setState(() {
                                     weight++;
                                   });
                                 },
                               )
                             ],
                            )


                          ],
                        ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                        colour: activeCardColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("AGE",
                            style: labelStyle),
                            Text(age.toString(),style: kNumberStyle),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundedButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: (){
                                    setState(() {
                                      age--;
                                    });

                                  },

                                ),
                                SizedBox(width:10.0),
                                RoundedButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: (){
                                    setState(() {
                                      age++;
                                    });
                                  },
                                )
                              ],
                            )
                          ],
                        ),
                    ),

                  ),
                ],
              ),
            ),
            BottomButton(
              onPressed: (){
                BMICalculator bmiCalculator = BMICalculator(height: height, weight: weight);
                Navigator.push(context,
                  MaterialPageRoute(builder: (context){
                    return ResultsPage(
                      bmiNumber: bmiCalculator.calculateBMI(),
                      bmiStatus: bmiCalculator.getBMIStatus(),
                      bmiDescription: bmiCalculator.getBMIInterpretationText(),
                    );
                  })
                );
              },
              buttonLabel: "CALCULATE",
            )
          ],
        )
    );
  }
}






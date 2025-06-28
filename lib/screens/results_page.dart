
import 'package:bmi/components/bottom_button.dart';
import 'package:bmi/components/reusable_card.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({required this.bmiStatus, required this.bmiNumber, required this.bmiDescription});

  final String bmiStatus;
  final String bmiNumber;
  final String bmiDescription;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("BMI CALCULATOR"),
      ),
        body:Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                  padding: EdgeInsets.all(15.0),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                      "Your Result",
                      style:kTitleStyle
                  )
              ),
            ),

            Expanded(
              flex: 5,
              child:ReusableCard(
                  colour: activeCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     Text(bmiStatus, style: kStatusStyle),
                     Text(bmiNumber,style: kBMITextStyle,),
                     Text(bmiDescription,
                       textAlign: TextAlign.center,
                       style: kDescriptionStyle,)
                    ]
                  ),
              )
            ),
            BottomButton(
              onPressed:(){
                  Navigator.pop(context);
                },
              buttonLabel: "RE-CALCULATE",
            )

          ],
        )
    );
  }
}

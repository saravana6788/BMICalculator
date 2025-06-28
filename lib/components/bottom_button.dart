import 'package:flutter/material.dart';

import '../constants.dart';

class BottomButton extends StatelessWidget {
   BottomButton({required this.buttonLabel, this.onPressed});
  GestureTapCallback? onPressed;
  String buttonLabel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          color:bottomContainerColor,
          margin: EdgeInsets.only(top: 10.0),
          width: double.infinity,
          height: bottomContainerHeight,
          child:
          Center(
              child:
              Text(buttonLabel,style:kButtonTextStyle)
          )
      ),
    );
  }
}

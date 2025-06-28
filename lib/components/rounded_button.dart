import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
   const RoundedButton({super.key, this.icon, this.onPressed});

  final IconData? icon;
  final VoidCallback? onPressed;


  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
        shape: CircleBorder(),
        fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        height: 56.0,
        width: 56.0
      ),
      elevation: 6.0,
      child: Icon(icon) ,

    );
  }
}

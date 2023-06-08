import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({Key? key, required this.onPressed,  this.backgroundColor = Colors.white,  this.textColor = Colors.black, required this.innerText}) : super(key: key);

  final VoidCallback onPressed ;
  final Color backgroundColor ;
  final Color textColor ;
  final String innerText ;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onPressed,
        color: backgroundColor,
        shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20) ) ,
        child: Text(innerText , style: TextStyle(color: textColor),),
    )

    ;
  }
}

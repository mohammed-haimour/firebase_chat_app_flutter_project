import 'package:flutter/material.dart';

class DefaultIconButton extends StatelessWidget {
  const DefaultIconButton({Key? key, required this.icon, required this.onPressed}) : super(key: key);

  final Icon icon ;
  final VoidCallback onPressed ;

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onPressed, icon: icon);
  }
}

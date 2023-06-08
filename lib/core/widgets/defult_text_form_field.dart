import 'package:flutter/material.dart';

class DefaultTextFormField extends StatelessWidget {
  const DefaultTextFormField({Key? key, required this.inputType, required this.innerText, required this.prefixIcon, this.suffixIcon, this.obscure = false, this.controller, this.validator}) : super(key: key);

  final TextInputType inputType ;
  final String innerText ;
  final Icon prefixIcon ;
  final Widget ? suffixIcon ;
  final bool ? obscure ;
  final TextEditingController ? controller ;
  final FormFieldValidator ?validator ;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
    validator: validator ,
      controller: controller,
      obscureText: obscure ?? false  ,
      keyboardType: TextInputType.emailAddress,

      decoration: InputDecoration(
        suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          label: Text(innerText)
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final String? Function(String?)? validator;

  MyTextField({
    @required this.controller,
    this.hintText = '',
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
          controller: controller,
          style: Theme.of(context).textTheme.bodyText1,
          decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              fillColor: Theme.of(context).cardColor,
              filled: true,
              hintText: hintText,
              /*prefixIcon: Icon(
              icon,
              color: kTextColor,
            ),*/
              hintStyle: Theme.of(context).textTheme.bodyText1,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none)),
          validator: validator),
    );
  }
}

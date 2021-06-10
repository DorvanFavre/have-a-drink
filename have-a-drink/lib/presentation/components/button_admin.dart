import 'package:flutter/material.dart';

class ButtonAdmin extends StatelessWidget {
  final VoidCallback? onTap;
  final String? text;

  ButtonAdmin({
    @required this.onTap,
    @required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        text ?? '-',
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
      style: TextButton.styleFrom(
          shadowColor: Colors.black45,
          elevation: 7,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: Colors.red),
    );
  }
}

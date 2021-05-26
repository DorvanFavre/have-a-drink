import 'package:flutter/material.dart';
import 'package:have_a_drink/presentation/components/button_1.dart';

class ButtonText extends StatelessWidget {
  final VoidCallback? onTap;
  final String? text;

  ButtonText({@required this.onTap, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Button1(
      onTap: onTap,
      child: Text(
        text ?? '',
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}

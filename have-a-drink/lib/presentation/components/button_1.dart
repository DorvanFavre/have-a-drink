import 'package:flutter/material.dart';

class Button1 extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget? child;

  Button1({
    @required this.onTap,
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: child ?? SizedBox.shrink(),
      style: TextButton.styleFrom(
          shadowColor: Colors.black45,
          elevation: 7,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: Theme.of(context).colorScheme.primary),
    );
  }
}

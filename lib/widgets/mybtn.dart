import 'package:flutter/material.dart';

import '../utils/my_colors.dart';

class MyBtn extends StatelessWidget {
  const MyBtn({super.key, required this.onPressed, required this.child});
  final void Function()? onPressed;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: buttonColor),
        onPressed: onPressed,
        child: child);
  }
}

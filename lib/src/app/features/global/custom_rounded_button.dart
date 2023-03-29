import 'package:flutter/material.dart';

class CustomRoundedButtonWidget extends StatelessWidget {
  const CustomRoundedButtonWidget({
    super.key,
    this.onClicked,
    required this.child,
  });

  final VoidCallback? onClicked;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClicked,
      child: child,
    );
  }
}

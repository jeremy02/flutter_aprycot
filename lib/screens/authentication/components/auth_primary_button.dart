import 'package:flutter/material.dart';
import '../../../components/primary_button.dart';

class AuthPrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final double widthFactor; // fraction of available width, default 1/3

  const AuthPrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.widthFactor = 1 / 3,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: constraints.maxWidth * widthFactor,
            child: PrimaryButton(
              label: label,
              onPressed: onPressed,
            ),
          ),
        );
      },
    );
  }
}

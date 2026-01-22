import 'package:flutter/material.dart';

class AuthCheckboxActionsField extends StatelessWidget {
  final bool centerWidget;
  final String checkboxText;
  final bool isChecked;
  final VoidCallback onToggle;
  final String? secondActionText;
  final VoidCallback? onSecondAction;

  const AuthCheckboxActionsField({
    super.key,
    required this.centerWidget,
    required this.checkboxText,
    required this.isChecked,
    required this.onToggle,
    this.secondActionText,
    this.onSecondAction,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: centerWidget ? MainAxisAlignment.center : MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: InkWell(
            onTap: onToggle,
            borderRadius: BorderRadius.circular(4),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 20,
                  height: 20,
                  child: Checkbox(
                    value: isChecked,
                    onChanged: null, // handled by InkWell
                    activeColor: const Color(0xFFEA6A12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    checkboxText,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF959895),
                      letterSpacing: -0.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        if (secondActionText != null && onSecondAction != null)
          Flexible(
            child: TextButton(
              onPressed: onSecondAction,
              child: Text(
                secondActionText!,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFEA6A12),
                  letterSpacing: -0.5,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

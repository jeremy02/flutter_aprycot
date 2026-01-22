import 'package:flutter/material.dart';

class AuthHeaderSection extends StatelessWidget {
  final String? title;
  final String? subtitle;

  const AuthHeaderSection({
    super.key,
    this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Image.asset(
            'images/nav_menu/aprycot_expanded.png',
            width: 150,
            fit: BoxFit.cover,
          ),
        ),
        if (title != null || subtitle != null) const SizedBox(height: 28),
        if (title != null)
          Align(
            alignment: Alignment.center,
            child: Text(
              title!,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w700,
                color: Color(0xFF07143B),
                letterSpacing: -0.5,
              ),
            ),
          ),
        if (title != null && subtitle != null) const SizedBox(height: 16),
        if (subtitle != null)
          Align(
            alignment: Alignment.center,
            child: Text(
              subtitle!,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xFF959895),
                letterSpacing: -0.5,
              ),
            ),
          ),
      ],
    );
  }
}

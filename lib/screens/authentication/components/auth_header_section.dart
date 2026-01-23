import 'package:flutter/material.dart';

class AuthHeaderSection extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? titleImagePath;

  const AuthHeaderSection({
    super.key,
    this.title,
    this.subtitle,
    this.titleImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Top logo
        Align(
          alignment: Alignment.centerLeft,
          child: Image.asset(
            'images/nav_menu/aprycot_expanded.png',
            width: 150,
            fit: BoxFit.cover,
          ),
        ),
        if (titleImagePath != null) ...[
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              titleImagePath!,
              width: 60,
              fit: BoxFit.cover,
            ),
          ),
        ],
        if (title != null || subtitle != null) const SizedBox(height: 20),
        if (title != null)
          Align(
            alignment: Alignment.center,
            child: Text(
              title!,
              style: const TextStyle(
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
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Color(0xFF959895),
                letterSpacing: -0.5,
                height: 1.5
              ),
              textAlign: TextAlign.center,
            ),
          ),
      ],
    );
  }
}

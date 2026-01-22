import 'package:flutter/material.dart';

typedef SocialIconCallback = void Function(String id, String imagePath);

class AuthFooterSection extends StatelessWidget {
  final String labelText;
  final List<Map<String, String>> socialIcons;
  final SocialIconCallback onSocialIconPressed;
  final String labelTextDescription;
  final String labelActionText;
  final VoidCallback onLabelActionTextPressed;

  const AuthFooterSection({
    super.key,
    required this.labelText,
    required this.socialIcons,
    required this.onSocialIconPressed,
    required this.labelTextDescription,
    required this.labelActionText,
    required this.onLabelActionTextPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 4,
            children: [
              Text(
                labelText,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFF07143B),
                  letterSpacing: -0.5,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: socialIcons.asMap().entries.map((entry) {
            final index = entry.key;
            final iconMap = entry.value;
            final imagePath = iconMap['image']!;
            final id = iconMap['id']!;
            return Row(
              children: [
                _buildSocialIcon(id, imagePath),
                if (index != socialIcons.length - 1) const SizedBox(width: 16),
              ],
            );
          }).toList(),
        ),
        const SizedBox(height: 16),
        Center(
          child: Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 4,
            children: [
              Text(
                labelTextDescription,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFF07143B),
                  letterSpacing: -0.8,
                ),
              ),
              TextButton(
                onPressed: onLabelActionTextPressed,
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  labelActionText,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFEA6A12),
                    letterSpacing: -0.8,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSocialIcon(String id, String imagePath) {
    return Material(
      color: Colors.transparent,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: () => onSocialIconPressed(id, imagePath),
        customBorder: const CircleBorder(),
        splashColor: Colors.black12,
        highlightColor: Colors.black12,
        child: Ink(
          width: 36,
          height: 36,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: 24,
              height: 24,
            ),
          ),
        ),
      ),
    );
  }
}

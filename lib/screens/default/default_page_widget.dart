import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/app_navigation_controller.dart';

class DefaultPageWidget extends StatelessWidget {
  final String sectionTitle;

  const DefaultPageWidget({super.key, required this.sectionTitle});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.dashboard_outlined,
            size: 64,
            color: Colors.grey.shade400,
          ),
          const SizedBox(height: 16),
          Text(
            sectionTitle,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Welcome to $sectionTitle section',
            style: TextStyle(color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }
}

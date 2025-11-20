import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/app_menu_controller.dart';
import '../components/navigation/navigation_rail_widget.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final AppMenuController controller = Get.put(AppMenuController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRailWidget(controller: controller),
          Expanded(child: _buildMainContent()),
        ],
      ),
    );
  }

  Widget _buildMainContent() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          color: Colors.white,
          child: Row(
            children: [
              Obx(() => IconButton(
                icon: Icon(
                  controller.isExpanded.value ? Icons.menu_open : Icons.menu,
                  color: Colors.grey.shade700,
                ),
                onPressed: controller.toggleExpansion,
              )),
              const SizedBox(width: 16),
              Obx(() => Text(
                controller.currentPage.value,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade800),
              )),
            ],
          ),
        ),
        Expanded(
          child: Center(
            child: Obx(
                  () => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.dashboard_outlined,
                      size: 64, color: Colors.grey.shade400),
                  const SizedBox(height: 16),
                  Text(controller.currentPage.value,
                      style:
                      TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text('Welcome to ${controller.currentPage.value} section'),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

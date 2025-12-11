import 'package:flutter/material.dart';
import 'package:flutter_sidebar_x/utils/responsive.dart';
import 'package:get/get.dart';
import '../../controllers/app_menu_controller.dart';
import '../components/navigation/navigation_rail_widget.dart';
import 'dashboard/dashboard_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final AppMenuController controller = Get.put(AppMenuController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRailWidget(controller: controller),
          Expanded(
              child: _buildMainContent(context),
          ),
        ],
      ),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
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
                    color: Colors.grey.shade800
                ),
              )),
            ],
          ),
        ),
        Expanded(
          child: Obx(
                () {
              if (controller.selectedSubmenuId.value == "dashboard" && Responsive.isDesktop(context)) {
                // Only show this text when submenu is selected
                return SingleChildScrollView(
                  child: DashboardScreen(),
                );
              }

              // Otherwise show the full column
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                        Icons.dashboard_outlined,
                        size: 64,
                        color: Colors.grey.shade400
                    ),
                    const SizedBox(height: 16),
                    Text(
                        controller.currentPage.value,
                        style:
                        TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        )
                    ),
                    const SizedBox(height: 8),
                    Text('Welcome to ${controller.currentPage.value} section'),
                  ],
                ),
              );
            },
          )
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_sidebar_x/screens/user_profile/user_profile_screen.dart';
import 'package:get/get.dart';
import 'package:flutter_sidebar_x/utils/responsive.dart';
import '../../controllers/app_navigation_controller.dart';
import '../components/navigation/navigation_rail_widget.dart';
import 'authentication/sign-in-screen/sign_in_screen.dart';
import 'dashboard/dashboard_screen.dart';
import 'default/default_page_widget.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final AppNavigationController controller = Get.put(AppNavigationController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.handleBackButton,
      child: Scaffold(
        body: Obx(() {
          final showRail = controller.showRail.value;

          return Row(
            children: [
              if (showRail) NavigationRailWidget(controller: controller),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (showRail)
                      _buildHeader(),
                    _buildContent(context),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Row(
        children: [
          IconButton(
            icon: Obx(() => Icon(
              controller.isExpanded.value
                  ? Icons.menu_open
                  : Icons.menu,
              color: Colors.grey.shade700,
            )),
            onPressed: controller.toggleExpansion,
          ),
          const SizedBox(width: 16),
          Obx(() => Text(
            controller.currentPage.value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade800,
            ),
          )),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFFFf5EE),
        ),
        child: Obx(() {
          // show screens if on desktop else show DefaultPageWidget
          if(Responsive.isDesktop(context)) {
            if (controller.selectedSubmenuId.value == "dashboard"){
              return SingleChildScrollView(
                child: DashboardScreen(),
              );
            } else if (controller.selectedSubmenuId.value == "authentication"){
              return SignInScreen();
            } else if (controller.selectedSubmenuId.value == "user_profile"){
              return SingleChildScrollView(
                child: UserProfileScreen(),
              );
            }
          }

          // Default empty page for other selections
          return DefaultPageWidget(sectionTitle: controller.currentPage.value);
        }),
      ),
    );
  }
}

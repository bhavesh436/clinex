import 'package:clinex/core/constants/app_colors.dart';
import 'package:clinex/features/clinex/presentation/pages/all_doctor_screen.dart';
import 'package:clinex/features/clinex/presentation/pages/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeNavigationController());
    return Scaffold(
      bottomNavigationBar: Obx(
            () => NavigationBar(
              backgroundColor: Colors.white,
          height: 80,
          indicatorColor: primaryColor.withOpacity(0.2),
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
          controller.selectedIndex.value = index,
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.hospital4), label: 'Doctors'),
            NavigationDestination(
                icon: Icon(Iconsax.heart), label: 'Whishlist'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class HomeNavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const Dashboard(),
    const DoctorTabBar(),
    Container(color: primaryColor.withOpacity(0.7),),
    Container(color: primaryColor.withOpacity(0.8),)
  ];

  // Function to navigate to a specific index
  void navigateToIndex(int index) {
    if (index >= 0 && index < screens.length) {
      selectedIndex.value = index;
    } else {
      print("Invalid index: $index"); // Debugging for invalid indexes
    }
  }

}

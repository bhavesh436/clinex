import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../controllers/doctor_controller.dart';

class DoctorSpecialitySection extends StatelessWidget {
  DoctorSpecialitySection({
    super.key,
  });


  final List<Map<String, dynamic>> categories = [
    {'icon': Iconsax.people5, 'name': 'General'},
    {'icon': Icons.earbuds, 'name': 'Dentist'},
    {'icon': Icons.shopping_bag, 'name': 'Ophthalmologist,'},
    {'icon': Icons.home, 'name': 'Nutrition'},
    {'icon': Iconsax.briefcase, 'name': 'Neurologist'},
    {'icon': Icons.school, 'name': 'Pediatric'},
    {'icon': Icons.local_hospital, 'name': 'Radiologist'},
    {'icon': Iconsax.more, 'name': 'More'},
  ];



  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DoctorController>();
    return LayoutBuilder(
      builder: (context, constraints) {
        double gridSpacing = constraints.maxWidth * 0.02;
        double gridItemWidth = (constraints.maxWidth - (gridSpacing * 5)) / 4;
        return Padding(
          padding: EdgeInsets.all(gridSpacing),
          child: GridView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: gridSpacing,
              mainAxisSpacing: gridSpacing,
              childAspectRatio: 0.8, // Adjust to control height of items
            ),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: gridItemWidth * 0.75,
                    height: gridItemWidth * 0.75,
                    decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      categories[index]['icon'],
                      size: gridItemWidth * 0.4,
                      color: primaryColor,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    categories[index]['name'],
                    textAlign: TextAlign.center,
                    maxLines : 1,
                    style: TextStyle(
                      fontSize: gridItemWidth * 0.15,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}

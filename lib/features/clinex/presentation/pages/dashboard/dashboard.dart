import 'package:clinex/core/constants/app_colors.dart';
import 'package:clinex/core/constants/widgets/section_heading.dart';
import 'package:clinex/features/clinex/domain/entities/doctor_entity.dart';
import 'package:clinex/features/clinex/presentation/controllers/like_controller.dart';
import 'package:clinex/features/clinex/presentation/pages/all_doctor_screen.dart';
import 'package:clinex/features/clinex/presentation/pages/dashboard/widgets/my_carousel_widget.dart';
import 'package:clinex/features/clinex/presentation/pages/doctor_detial_screen.dart';
import 'package:clinex/features/clinex/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../controllers/doctor_controller.dart';
import 'widgets/doctor_speciality_section.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeNavigationController>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    children: [
                      // Header
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: primaryColor.withOpacity(0.2)
                            ),
                            padding: const EdgeInsets.all(15),
                            child: const Icon(Icons.sailing),),
                          const SizedBox(width: 8,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Good Morning 👋',style: Theme.of(context).textTheme.bodyLarge!.apply(color: Colors.grey,fontWeightDelta: 1)),
                              Text('Andrew Ainsley',style: Theme.of(context).textTheme.headlineSmall!.apply(color: Colors.black,fontWeightDelta: 1),)
                            ],
                          ),
                          const Spacer(),
                          const Icon(Iconsax.notification),
                          const SizedBox(width: 12,),
                          const Icon(Iconsax.heart_tick)
                        ],
                      ),
                      const SizedBox(height: 24,),

                      // Search Filed
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Iconsax.search_normal,color: Colors.grey,),
                          hintText: 'Search...',
                          suffixIcon: Icon(Icons.filter_list_outlined,color: primaryColor,)
                        ),
                      ),
                      const SizedBox(height: 24,),

                      // Banners
                      MyCarouselWidget(),

                      // Grid Section
                      const MySectionHeading(title: 'Doctor Speciality'),
                      DoctorSpecialitySection(),

                      // TOP DOCTORS
                      MySectionHeading(title: 'Top Doctors',onPressed: () => controller.navigateToIndex(1),),
                      const SizedBox(height: 12,),
                      DefaultTabController(
                        length: Get.find<DoctorController>().specializations.length,
                        child: SizedBox(
                          height: 400,
                          child: const DoctorTabSection(physics: NeverScrollableScrollPhysics(),),
                        ),
                      ),
                      const SizedBox(height: 12),


                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


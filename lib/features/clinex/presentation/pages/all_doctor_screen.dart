import 'package:clinex/core/constants/app_colors.dart';
import 'package:clinex/features/clinex/presentation/pages/dashboard/widgets/doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../controllers/doctor_controller.dart';

class DoctorTabBar extends StatelessWidget {
  const DoctorTabBar({super.key});


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: Get.find<DoctorController>().specializations.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Top Doctors',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            const Icon(Iconsax.search_normal),
            const SizedBox(width: 16,),
            const Icon(Iconsax.message),
            const SizedBox(width: 20,)
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              // Search Filed
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Iconsax.search_normal,color: Colors.grey,),
                    hintText: 'Search...',
                    suffixIcon: Icon(Icons.filter_list_outlined,color: primaryColor,)
                ),
              ),
              const SizedBox(height: 24,),
              const Expanded(child: DoctorTabSection(physics: BouncingScrollPhysics(),)),
            ],
          ),
        ),
      ),
    );
  }
}

class DoctorTabSection extends StatelessWidget {
  const DoctorTabSection({super.key, this.physics});

  final ScrollPhysics? physics;
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DoctorController>();

    return Obx(() {
      if (controller.specializations.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      }

      return Column(
        children: [
          TabBar(
            indicator: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: primaryColor, width: 1),
            ),
            labelPadding: const EdgeInsets.symmetric(horizontal: 24),
            tabAlignment: TabAlignment.start,
            labelColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: primaryColor,
            isScrollable: true,
            dividerColor: Colors.transparent,
            tabs: controller.specializations
                .map((specialization) => Tab(text: specialization))
                .toList(),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: TabBarView(
              children: controller.specializations.map((specialization) {
                return specialization == 'All'
                    ? DoctorList(controller.doctors,physics: physics,)
                    : DoctorList(controller.doctors
                    .where((doc) => doc.specialization == specialization)
                    .toList(),physics: physics,);
              }).toList(),
            ),
          ),
        ],
      );
    });
  }
}


class DoctorList extends StatelessWidget {
  final List<dynamic> doctors;
  final ScrollPhysics? physics;
  const DoctorList(this.doctors, {super.key,this.physics});


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: physics,
      itemCount: doctors.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: DoctorCard(doctor: doctors[index]),
        );
      },
    );
  }
}

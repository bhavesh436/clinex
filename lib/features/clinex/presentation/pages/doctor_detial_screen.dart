  import 'package:clinex/core/constants/app_colors.dart';
import 'package:clinex/core/constants/widgets/curved_edged_widget.dart';
import 'package:clinex/core/constants/widgets/section_heading.dart';
import 'package:clinex/features/clinex/domain/entities/doctor_entity.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class DoctorDetailScreen extends StatelessWidget {
    const DoctorDetailScreen({super.key, required this.doctor});

    final DoctorEntity doctor;
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        floatingActionButton: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 18),
            elevation: 12

          ),
            onPressed: (){}, child: const Text('🩺  Book Appointment')),
        body: Stack(
          children : [ SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyCurvedEdgeWidget(
                  child: Stack(
                    children: [
                      Image.asset(
                        height: 300,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        doctor.profilePicture
                      ),
                      Positioned(
                        top: 35,
                        left: 25,
                        child: IconButton(onPressed: (){
                          Navigator.pop(context);
                        }, icon: const Icon(Icons.arrow_back_ios,color: Colors.black,)),
                      ),
                    ],

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(doctor.name,style: Theme.of(context).textTheme.titleLarge!.apply(fontWeightDelta: 1),),
                          const Icon(Iconsax.share),
                        ],
                      ),
                      const SizedBox(height: 8,),
                      Text(doctor.specialization  ,style: Theme.of(context).textTheme.bodyLarge!.apply(fontWeightDelta: 1,color: Colors.grey),),
                      const SizedBox(height: 16,),
                      Row(
                        children: [
                          const DoctorBox(
                            iconData: Iconsax.people,
                            title: 'Patient',
                            subtitle: '1000+',
                          ),
                          const SizedBox(width: 24,),
                          DoctorBox(
                            iconData: Iconsax.star_1,
                            title: 'Ratings',
                            subtitle: doctor.rating.toString(),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24,),
                      const MySectionHeading(title: 'Specialist',showActionButton: false,),
                      const SizedBox(height: 8,),
                      Wrap(
                        children: [
                          for(int i = 0; i <=3; i++)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ChoiceChip(
                                backgroundColor: primaryColor.withOpacity(0.3),

                                padding: const EdgeInsets.all(12),
                                  label: const Text('Skin hair'), selected: true),
                            )
                        ],
                      ),
                      const SizedBox(height: 24,),
                      const MySectionHeading(title: 'Working time ',showActionButton: false,),
                      const SizedBox(height: 8,),
                      Text('Sat - Mon 10:30 to 6:30 PM',style :Theme.of(context).textTheme.bodyLarge!.apply(fontWeightDelta: 1,color: Colors.grey),),

                      const SizedBox(height: 24,),
                      const MySectionHeading(title: 'About',showActionButton: false,),
                      const Divider(),
                      SizedBox(height: 6,),
                      Text('Expert in ${doctor.specialization}, committed to offering high-quality care with a focus on patient well-being."'),
                    ],
                  ),
                )
              ],
            )
          ),
      ]
        ),
      );
    }
  }

class DoctorBox extends StatelessWidget {
  const DoctorBox({
    super.key, required this.iconData, required this.title, required this.subtitle,
  });

  final IconData iconData;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding : const EdgeInsets.all(12),
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: primaryColor),
          ),
          child: Icon(iconData),
        ),
        const SizedBox(width: 8,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,style: Theme.of(context).textTheme.bodyLarge!.apply(color: Colors.grey),),
            Text(subtitle,style: Theme.of(context).textTheme.bodyLarge!.apply(fontWeightDelta: 1),),
          ],
        )
      ],
    );
  }
}

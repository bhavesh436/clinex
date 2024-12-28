import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../domain/entities/doctor_entity.dart';
import '../../doctor_detial_screen.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({
    super.key, required this.doctor,
  });


  final DoctorEntity doctor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (builder) => DoctorDetailScreen(doctor: doctor,)));
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2), // Softer shadow color
              spreadRadius: 0, // No spread
              blurRadius: 8, // Larger blur for a softer look
              offset: const Offset(0, 4), // Subtle vertical offset
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18.0), // Inner image corners
              child: Image.asset(
                doctor.profilePicture,
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(doctor.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyLarge!.apply(fontWeightDelta: 1,heightDelta: 1)),
                      ),
                      IconButton(
                          onPressed: (){

                          },
                          icon:  const Icon(Iconsax.heart)),
                    ],
                  ),
                  const Divider(),

                  Text(doctor.specialization,),
                  const SizedBox(height: 12,),
                  Row(
                    children: [
                      const Icon(Iconsax.star,size: 18,),
                      const SizedBox(width: 6,),
                      Text(doctor.rating.toString()),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
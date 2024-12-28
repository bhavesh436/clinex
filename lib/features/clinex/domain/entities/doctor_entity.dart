import 'package:get/get.dart';

class DoctorEntity {
  final int id;
  final String name;
  final String specialization;
  final String profilePicture;
  final double rating;

  DoctorEntity({
    required this.id,
    required this.name,
    required this.specialization,
    required this.profilePicture,
    required this.rating,
  });
}

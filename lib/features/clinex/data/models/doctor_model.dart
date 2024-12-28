import '../../domain/entities/doctor_entity.dart';

class DoctorModel extends DoctorEntity {
  DoctorModel({
    required super.id,
    required super.name,
    required super.specialization,
    required super.profilePicture,
    required super.rating,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      id: json['id'],
      name: json['name'],
      specialization: json['specialization'],
      profilePicture: json['profile_picture'],
      rating: json['rating'].toDouble(),
    );
  }
}

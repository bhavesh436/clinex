import '../../data/models/doctor_model.dart';
import '../entities/doctor_entity.dart';

abstract class DoctorRepository {
  Future<List<DoctorEntity>> getDoctors();
}
import 'package:flutter/services.dart';
import '../../domain/entities/doctor_entity.dart';
import '../../domain/repositories/doctor_repository.dart';
import '../datasources/doctor_local_data_source.dart';
import '../models/doctor_model.dart';

class DoctorRepositoryImpl implements DoctorRepository {
  final DoctorLocalDataSource dataSource;

  DoctorRepositoryImpl(this.dataSource);

  @override
  Future<List<DoctorEntity>> getDoctors() async {
    try {
      final data = await dataSource.fetchDoctors('assets/doctors.json');
      return data.map((json) => DoctorModel.fromJson(json)).toList();
    } catch (e) {
      throw PlatformException(code: 'ERROR', message: 'Failed to load data.');
    }
  }
}
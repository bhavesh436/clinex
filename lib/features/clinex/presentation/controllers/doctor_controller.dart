import 'package:clinex/features/clinex/domain/entities/doctor_entity.dart';
import 'package:clinex/features/clinex/domain/usecases/fetch_doctor.dart';
import 'package:get/get.dart';

class DoctorController extends GetxController {
  final GetDoctorsUseCase getDoctorsUseCase;

  var doctors = <DoctorEntity>[].obs;
  var specializations = <String>[].obs;

  DoctorController(this.getDoctorsUseCase);

  @override
  void onInit() {
    super.onInit();
    loadDoctors();
  }

  Future<void> loadDoctors() async {
    final result = await getDoctorsUseCase();
    doctors.value = result;

    final uniqueSpecializations = [
      'All',
      ...doctors.map((doc) => doc.specialization).toSet(),
    ];
    specializations.value = uniqueSpecializations;
  }
}
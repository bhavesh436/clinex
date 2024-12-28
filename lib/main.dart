import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/constants/theme.dart';
import 'features/clinex/auth/pages/login_screen.dart';
import 'features/clinex/data/datasources/doctor_local_data_source.dart';
import 'features/clinex/data/repositories/doctor_repository_impl.dart';
import 'features/clinex/domain/usecases/fetch_doctor.dart';
import 'features/clinex/presentation/controllers/doctor_controller.dart';

void main() {

  final localDataSource = DoctorLocalDataSource();
  final repository = DoctorRepositoryImpl(localDataSource);
  final fetchDoctorsUseCase = GetDoctorsUseCase(repository);
  Get.put(DoctorController(fetchDoctorsUseCase));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      theme: MyAppTheme.lightTheme,
      darkTheme: MyAppTheme.darkTheme,
      home: const LoginScreen()
    );
  }
}
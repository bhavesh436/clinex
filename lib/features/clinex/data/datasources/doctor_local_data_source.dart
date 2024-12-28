

import 'dart:convert';

import 'package:flutter/services.dart';

import '../../../../core/utils/json_loader.dart';

class DoctorLocalDataSource {
  Future<List<Map<String, dynamic>>> fetchDoctors(String path) async {
    try {
      final jsonString = await rootBundle.loadString(path);
      return List<Map<String, dynamic>>.from(jsonDecode(jsonString));
    } catch (e) {
      print('Error loading JSON: $e');
      rethrow;
    }
  }
}
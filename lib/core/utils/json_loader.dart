import 'dart:convert';

import 'package:flutter/services.dart';
// Not Used
class JsonLoader {
  static Future<List<dynamic>> loadJson(String path) async {
    final jsonString = await rootBundle.loadString(path);
    return jsonDecode(jsonString);
  }
}
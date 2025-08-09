import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/app.dart';
import 'data/repositories/data_repository.dart';

void main() {
  // Initialize DataRepository before running the app
  Get.put(DataRepository());
  runApp(MyApp());
}

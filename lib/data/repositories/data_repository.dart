import 'dart:convert';
import 'package:get/get.dart';
import '../../core/constants/app_constants.dart';
import '../../core/utils/helpers.dart';
import '../models/book_model.dart';

class DataRepository extends GetxService {
  Future<List<Book>> getBooks() async {
    final jsonString = await loadJsonData(AppConstants.naatsJsonPath);
    final List<dynamic> jsonData = json.decode(jsonString);
    return jsonData.map((json) => Book.fromJson(json)).toList();
  }
}

import 'package:dio/dio.dart';

import '../../domain/entities/fruit.dart';

class FruitRemoteDataSource {
  final Dio dio = Dio();
  final String baseUrl =
      "https://tugas2-mobile-default-rtdb.asia-southeast1.firebasedatabase.app";
  final String authKey = "RoSzxN5VFoR5rRfLVoyJ9Z6MXovWFmkI7Z8bVlu3";

  Future<List<Map<String, dynamic>>> getFruits() async {
    try {
      final response = await dio.get("$baseUrl/buah.json?auth=$authKey");

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData =
            (response.data as Map<String, dynamic>?) ?? {};

        return responseData.entries
            .map((entry) =>
                {'id': entry.key, ...(entry.value as Map<String, dynamic>)})
            .toList();
      } else {
        throw Exception('Failed to load fruits');
      }
    } catch (error) {
      throw Exception('Failed to load fruits: $error');
    }
  }

  Future<void> updateFruit(Fruit updatedFruit) async {
    try {
      final response = await dio.put(
        "$baseUrl/buah/${updatedFruit.id}.json?auth=$authKey",
        data: updatedFruit.toJson(),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to update fruit. Server responded with ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to update fruit: $error');
    }
  }

  Future<void> addFruit(Fruit newFruit) async {
    try {
      final response = await dio.post(
        "$baseUrl/buah.json?auth=$authKey",
        data: newFruit.toJson(),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to add new fruit. Server responded with ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to add new fruit: $error');
    }
  }

  Future<void> deleteFruit(String id) async {
    try {
      final response = await dio.delete(
        "$baseUrl/buah/$id.json?auth=$authKey",
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to delete fruit. Server responded with ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to delete fruit: $error');
    }
  }
}

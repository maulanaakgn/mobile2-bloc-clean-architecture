import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio = Dio();

  Future<Response> fetchData() async {
    try {
      return await _dio.get(
        'https://tugas2-mobile-default-rtdb.asia-southeast1.firebasedatabase.app/buah.json?auth=RoSzxN5VFoR5rRfLVoyJ9Z6MXovWFmkI7Z8bVlu3',
      );
    } catch (e) {
      throw Exception('Failed to fetch data');
    }
  }
}

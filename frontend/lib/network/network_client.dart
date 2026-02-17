import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NetworkClient {
  late Dio _dio;
  
  // Replace with your local IP or backend URL
  // For Android Emulator use 10.0.2.2, for iOS Simulator use localhost
  final String baseUrl = 'http://localhost:5000/api'; 

  NetworkClient() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ));

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final prefs = await SharedPreferences.getInstance();
        final token = prefs.getString('token');
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
      onError: (DioException e, handler) {
        // Handle errors globally
        print('Dio Error: ${e.message}');
        return handler.next(e);
      },
    ));
  }

  Dio get dio => _dio;
}

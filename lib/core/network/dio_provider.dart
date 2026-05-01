import 'package:dio/dio.dart';

class DioProvider {
  static const String _anonKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJwbXFzb2hpd2pzcGd0Y2tiamdzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Nzc2MDUyMDksImV4cCI6MjA5MzE4MTIwOX0.6vt7ZWnmvePrQ9MWYiT24yDOlK2GG57sAQGMEJhA6Jk';

  static Dio createDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: "https://bpmqsohiwjspgtckbjgs.supabase.co",
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          'apikey': _anonKey,
          'Authorization': 'Bearer $_anonKey',
          'Content-Type': 'application/json',
        },
      ),
    );

    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));

    return dio;
  }
}

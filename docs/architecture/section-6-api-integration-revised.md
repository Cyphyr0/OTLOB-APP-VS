### **Section 6: API Integration (Revised)**

#### **API Client Configuration (`api/dio_client.dart`)**
```dart
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioClient {
  static Dio getInstance() {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.otlob.com/v1',
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );

    if (kDebugMode) {
      dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    }
    dio.interceptors.add(AuthInterceptor(/* Inject TokenStorage service here */));
    dio.interceptors.add(ErrorInterceptor(/* Inject services needed for token refresh */));

    return dio;
  }
}

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    super.onRequest(options, handler);
  }
}

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      print('Caught 401 Error. Token refresh logic would go here.');
    }
    super.onError(err, handler);
  }
}
```

#### **DataSource Template (`data/datasources/restaurant_remote_datasource.dart`)**
```dart
import 'package:dio/dio.dart';
import 'package:otlob/data/models/restaurant.dart';
import 'package:otlob/core/error/exceptions.dart';

abstract class RestaurantRemoteDataSource {
  Future<List<Restaurant>> getRestaurants();
}

class RestaurantRemoteDataSourceImpl implements RestaurantRemoteDataSource {
  final Dio dio;
  RestaurantRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<Restaurant>> getRestaurants() async {
    try {
      final response = await dio.get('/restaurants');
      if (response.statusCode == 200 && response.data != null) {
        return (response.data as List)
            .map((json) => Restaurant.fromJson(json))
            .toList();
      } else {
        throw ServerException('Failed to load restaurants', statusCode: response.statusCode);
      }
    } on DioException catch (e) {
      throw ServerException(e.message ?? 'An unknown error occurred', statusCode: e.response?.statusCode);
    }
  }
}
```

#### **Testing the API Layer**
To unit test components that depend on a `DataSource`, we will use a mocking library (like `mockito`) to create a mock version of the `DataSource` interface.
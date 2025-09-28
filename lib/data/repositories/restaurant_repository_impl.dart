import 'package:otlob/data/datasources/restaurant_remote_datasource.dart';
import 'package:otlob/data/models/restaurant_model.dart';
import 'package:otlob/domain/repositories/restaurant_repository.dart';

class RestaurantRepositoryImpl implements RestaurantRepository {
  final RestaurantRemoteDataSource remoteDataSource;

  RestaurantRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<RestaurantModel>> getRestaurants() async {
    return await remoteDataSource.getRestaurants();
  }
}

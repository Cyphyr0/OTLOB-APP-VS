import 'package:otlob/data/models/restaurant_model.dart';

abstract class RestaurantRemoteDataSource {
  Future<List<RestaurantModel>> getRestaurants();
}

class RestaurantRemoteDataSourceImpl implements RestaurantRemoteDataSource {
  @override
  Future<List<RestaurantModel>> getRestaurants() async {
    // Mock data
    await Future.delayed(const Duration(seconds: 1));
    return [
      const RestaurantModel(
        name: 'Koshary El Tahrir',
        imageUrl: 'https://via.placeholder.com/150',
      ),
      const RestaurantModel(
        name: 'Gad',
        imageUrl: 'https://via.placeholder.com/150',
      ),
      const RestaurantModel(
        name: 'Abou Tarek',
        imageUrl: 'https://via.placeholder.com/150',
      ),
    ];
  }
}

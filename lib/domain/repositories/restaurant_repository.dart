import 'package:otlob/data/models/restaurant_model.dart';

abstract class RestaurantRepository {
  Future<List<RestaurantModel>> getRestaurants();
}

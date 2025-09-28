import 'package:equatable/equatable.dart';

class RestaurantModel extends Equatable {
  final String name;
  final String imageUrl;

  const RestaurantModel({required this.name, required this.imageUrl});

  @override
  List<Object> get props => [name, imageUrl];
}

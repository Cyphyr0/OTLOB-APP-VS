import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:otlob/data/models/restaurant_model.dart';
import 'package:otlob/domain/repositories/restaurant_repository.dart';

part 'restaurant_event.dart';
part 'restaurant_state.dart';

class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  final RestaurantRepository restaurantRepository;

  RestaurantBloc({required this.restaurantRepository}) : super(RestaurantInitial()) {
    on<LoadRestaurants>((event, emit) async {
      emit(RestaurantLoading());
      try {
        final restaurants = await restaurantRepository.getRestaurants();
        emit(RestaurantLoaded(restaurants));
      } catch (e) {
        emit(RestaurantError(e.toString()));
      }
    });
  }
}

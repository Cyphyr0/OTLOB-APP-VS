### **Section 5: State Management Architecture (Revised)**

#### **Guiding Principles**
*   **Bloc vs. Cubit:** Use **Cubit** for simple state management. Use **BLoC** for more complex scenarios with a variety of inputs.
*   **Immutability:** All state classes must be immutable.
*   **Testing:** Every BLoC and Cubit must have a corresponding test file.

#### **Error Handling Model**
```dart
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  final int? statusCode;

  const Failure(this.message, {this.statusCode});

  @override
  List<Object?> get props => [message, statusCode];
}

class ServerFailure extends Failure {
  const ServerFailure(super.message, {super.statusCode});
}
```

#### **BLoC/Cubit File Structure**
```plaintext
features/home/bloc/
|-- home_bloc.dart
|-- home_event.dart
|-- home_state.dart
```

#### **State Management Template (BLoC)**
**`home_state.dart` (Revised)**
```dart
part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}
class HomeLoading extends HomeState {}
class HomeRefreshing extends HomeState {}
class HomeEmpty extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Restaurant> restaurants;
  const HomeLoaded(this.restaurants);
  @override
  List<Object> get props => [restaurants];
}

class HomeError extends HomeState {
  final Failure failure;
  const HomeError(this.failure);
  @override
  List<Object> get props => [failure];
}
```

**`home_bloc.dart` (Revised with DI and improved logic)**
```dart
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final RestaurantRepository _restaurantRepository;

  HomeBloc({required RestaurantRepository restaurantRepository})
      : _restaurantRepository = restaurantRepository,
        super(HomeInitial()) {
    on<FetchRestaurants>(_onFetchRestaurants);
  }

  Future<void> _onFetchRestaurants(
    FetchRestaurants event,
    Emitter<HomeState> emit,
  ) async {
    if (state is HomeLoaded) {
      emit(HomeRefreshing());
    } else {
      emit(HomeLoading());
    }
    
    try {
      final restaurants = await _restaurantRepository.getRestaurants();
      if (restaurants.isEmpty) {
        emit(HomeEmpty());
      } else {
        emit(HomeLoaded(restaurants));
      }
    } on ServerException catch (e) {
      emit(HomeError(ServerFailure(e.message, statusCode: e.statusCode)));
    }
  }
}
```

#### **Observability**
*   **BlocObserver:** A global `BlocObserver` will be configured at the root of the application for logging transitions and errors during development.
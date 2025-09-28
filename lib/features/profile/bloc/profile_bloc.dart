import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:otlob/app/di.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetUser getUser;
  final GetAddresses getAddresses;
  final AddAddressUseCase addAddress;
  final EditAddressUseCase editAddress;
  final DeleteAddressUseCase deleteAddress;

  ProfileBloc({
    required this.getUser,
    required this.getAddresses,
    required this.addAddress,
    required this.editAddress,
    required this.deleteAddress,
  }) : super(ProfileInitial()) {
    on<LoadProfile>((event, emit) async {
      emit(ProfileLoading());
      try {
        // ignore: unused_local_variable
        final user = await getUser();
        // ignore: unused_local_variable
        final addresses = await getAddresses();
        emit(const ProfileLoaded(
          name: 'John Doe', // TODO: get from user
          addresses: ['123 Main St, Cairo, Egypt'], // TODO: get from addresses
        ));
      } catch (e) {
        emit(ProfileError(e.toString()));
      }
    });
  }
}
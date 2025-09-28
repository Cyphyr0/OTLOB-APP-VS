part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class LoadProfile extends ProfileEvent {}

class AddAddress extends ProfileEvent {
  final String address;

  const AddAddress(this.address);

  @override
  List<Object> get props => [address];
}

class EditAddress extends ProfileEvent {
  final String oldAddress;
  final String newAddress;

  const EditAddress(this.oldAddress, this.newAddress);

  @override
  List<Object> get props => [oldAddress, newAddress];
}

class DeleteAddress extends ProfileEvent {
  final String address;

  const DeleteAddress(this.address);

  @override
  List<Object> get props => [address];
}

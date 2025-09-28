import 'package:equatable/equatable.dart';

class AddressModel extends Equatable {
  final String address;

  const AddressModel({required this.address});

  @override
  List<Object> get props => [address];
}

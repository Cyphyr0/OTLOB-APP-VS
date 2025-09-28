import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String name;

  const UserModel({required this.name});

  @override
  List<Object> get props => [name];
}

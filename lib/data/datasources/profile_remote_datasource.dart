import 'package:otlob/data/models/address_model.dart';
import 'package:otlob/data/models/user_model.dart';

abstract class ProfileRemoteDataSource {
  Future<UserModel> getUser();
  Future<List<AddressModel>> getAddresses();
  Future<void> addAddress(String address);
  Future<void> editAddress(String oldAddress, String newAddress);
  Future<void> deleteAddress(String address);
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  @override
  Future<UserModel> getUser() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return const UserModel(name: 'John Doe');
  }

  @override
  Future<List<AddressModel>> getAddresses() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return [const AddressModel(address: '123 Main St, Cairo, Egypt')];
  }

  @override
  Future<void> addAddress(String address) async {
    await Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  Future<void> editAddress(String oldAddress, String newAddress) async {
    await Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  Future<void> deleteAddress(String address) async {
    await Future.delayed(const Duration(milliseconds: 500));
  }
}

import 'package:otlob/data/datasources/profile_remote_datasource.dart';
import 'package:otlob/data/models/address_model.dart';
import 'package:otlob/data/models/user_model.dart';
import 'package:otlob/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;

  ProfileRepositoryImpl({required this.remoteDataSource});

  @override
  Future<UserModel> getUser() async {
    return await remoteDataSource.getUser();
  }

  @override
  Future<List<AddressModel>> getAddresses() async {
    return await remoteDataSource.getAddresses();
  }

  @override
  Future<void> addAddress(String address) async {
    await remoteDataSource.addAddress(address);
  }

  @override
  Future<void> editAddress(String oldAddress, String newAddress) async {
    await remoteDataSource.editAddress(oldAddress, newAddress);
  }

  @override
  Future<void> deleteAddress(String address) async {
    await remoteDataSource.deleteAddress(address);
  }
}

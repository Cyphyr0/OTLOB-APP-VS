import 'package:otlob/data/models/address_model.dart';
import 'package:otlob/data/models/user_model.dart';

abstract class ProfileRepository {
  Future<UserModel> getUser();
  Future<List<AddressModel>> getAddresses();
  Future<void> addAddress(String address);
  Future<void> editAddress(String oldAddress, String newAddress);
  Future<void> deleteAddress(String address);
}

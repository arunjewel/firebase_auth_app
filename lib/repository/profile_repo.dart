import 'package:firebase_auth_app/domain/profile/profile_services.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../domain/auth/models/user_model.dart';

@LazySingleton(as: ProfileService)
class ProfileRepo implements ProfileService {
  @override
  Future<UserModel> getUserData() async {
    final prefs = await SharedPreferences.getInstance();

    final String email = prefs.getString('email') ?? "";
    final String name = prefs.getString('name') ?? "";
    final String address = prefs.getString('address') ?? "";
    final String phone = prefs.getString('phone') ?? "";
    final String image = prefs.getString('image') ?? "";

    UserModel userModel = UserModel(
        email: email,
        userName: name,
        address: address,
        phone: phone,
        profileImage: image);
    return userModel;
  }

  @override
  Future<UserModel> updateUserData(UserModel userModel) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', userModel.email);
    await prefs.setString('name', userModel.userName);
    await prefs.setString('address', userModel.address ?? "");
    await prefs.setString('phone', userModel.phone ?? "");
    await prefs.setString('image', userModel.profileImage ?? "");
    return userModel;
  }
}

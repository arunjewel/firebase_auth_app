import '../auth/models/user_model.dart';

abstract class ProfileService{
  Future<UserModel> getUserData();
  Future<UserModel> updateUserData(UserModel userModel);
}
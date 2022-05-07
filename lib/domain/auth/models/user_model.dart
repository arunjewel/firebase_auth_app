class UserModel {
  final String userName;
  final String email;
  final String? address;
  final String? phone;
  final String? profileImage;

  UserModel(
      {required this.userName,
      required this.email,
      this.profileImage,
      this.phone,
      this.address});
}

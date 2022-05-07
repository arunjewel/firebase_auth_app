part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetUserData extends ProfileEvent {
  GetUserData();
}

class UpdateUserData extends ProfileEvent {
  final UserModel userModel;

  UpdateUserData(this.userModel);
}

part of 'profile_bloc.dart';

@immutable
abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}
class LoadingProfile extends ProfileState {
  @override
  List<Object> get props => [];
}
class ProfileInitial extends ProfileState {
  final UserModel userModel;
  const ProfileInitial(this.userModel);
}
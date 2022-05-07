import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../domain/auth/models/user_model.dart';
import '../../domain/profile/profile_services.dart';

part 'profile_event.dart';

part 'profile_state.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileService profileService;

  ProfileBloc({required this.profileService}) : super(LoadingProfile()) {
    UserModel userModel;
    on<GetUserData>((event, emit) async {
      userModel = await profileService.getUserData();
      emit(ProfileInitial(userModel));
    });
    on<UpdateUserData>((event, emit) async {
      emit(LoadingProfile());
      UserModel user= await profileService.updateUserData(event.userModel);
      emit(ProfileInitial(user));
    });
  }
}

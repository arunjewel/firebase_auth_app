import 'package:firebase_auth_app/core/utils.dart';
import 'package:firebase_auth_app/domain/auth/models/user_model.dart';
import 'package:firebase_auth_app/presentation/screens/homepage/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/profile/profile_bloc.dart';
import '../../../../core/constants.dart';
import '../../../widgets/button_widget.dart';
import '../../../widgets/network_loading.dart';
import '../widgets/profile_image_widget.dart';
import 'edit_profile.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<ProfileBloc>(context).add(GetUserData());
    });
    bool shouldPop = false;
    return WillPopScope(
        onWillPop: () async {
          toPageRemoveUntil(context,const HomePage());
          return shouldPop;
        },
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: kMainThemeColor,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: kSubThemeColor),
                onPressed: () =>  toPageRemoveUntil(context,const HomePage()),
              ),
              title: const Text("Profile"),
            ),
            body: BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
              if (state is LoadingProfile) {
                // Showing the loading indicator while the userdata is loading
                return const NetworkLoading();
              } else if (state is ProfileInitial) {
                //showing user data from local storage
                return SafeArea(
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      ProfileImageWidget(
                        imagePath: state.userModel.profileImage!,
                        onClicked: () {
                          toPage(
                              context,
                              EditProfilePage(
                                user: state.userModel,
                              ));
                        },
                      ),
                      const SizedBox(height: 24),
                      buildName(state.userModel),
                      ButtonWidget(
                        onClicked: () {
                          toPage(
                              context,
                              EditProfilePage(
                                user: state.userModel,
                              ));
                        },
                        text: "Edit Profile",
                      ),
                    ],
                  ),
                );
              } else {
                return const SafeArea(
                  child: Center(
                    child: Text("No Profile"),
                  ),
                );
              }
            })));
  }

  Widget buildName(UserModel user) => Column(
        children: [
          Text(
            user.userName,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          buildUserDetails(user.email),
          buildUserDetails(user.phone ?? ""),
          buildUserDetails(user.address ?? ""),
        ],
      );

  Column buildUserDetails(String userData) {
    return Column(children: [
      Text(
        userData,
        style: const TextStyle(color: Colors.grey),
      ),
      const SizedBox(height: 4),
    ]);
  }
}

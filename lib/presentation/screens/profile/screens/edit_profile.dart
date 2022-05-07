import 'package:firebase_auth_app/core/utils.dart';
import 'package:firebase_auth_app/domain/auth/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/profile/profile_bloc.dart';
import '../../../widgets/button_widget.dart';
import '../../../widgets/custom_appbar.dart';
import '../../../widgets/text_field_widget.dart';
import '../widgets/profile_image_widget.dart';
import 'profile.dart';

class EditProfilePage extends StatefulWidget {
  final UserModel user;

  const EditProfilePage({Key? key, required this.user}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController addressController;
  late final TextEditingController mobileController;
  late UserModel user;

  @override
  void initState() {
    super.initState();
    user = widget.user;
    nameController = TextEditingController(text: user.userName);
    mobileController = TextEditingController(text: user.phone);
    addressController = TextEditingController(text: user.address);
    emailController = TextEditingController(text: user.email);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    mobileController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: CustomAppBar(
            title: "Edit Profile",
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          physics: const BouncingScrollPhysics(),
          children: [
            ProfileImageWidget(
              imagePath: user.profileImage!,
              isEdit: true,
              onClicked: () async {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Full Name',
              controller: nameController,
              onChanged: (name) {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Email',
              controller: emailController,
              textInputType: TextInputType.emailAddress,
              onChanged: (email) {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Phone',
              controller: mobileController,
              textInputType: TextInputType.phone,
              onChanged: (phone) {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Address',
              controller: addressController,
              maxLines: 3,
              onChanged: (about) {},
            ),
            const SizedBox(height: 24),
            ButtonWidget(
              onClicked: () {
                BlocProvider.of<ProfileBloc>(context).add(UpdateUserData(
                    UserModel(
                        email: emailController.text,
                        userName: nameController.text,
                        address: addressController.text,
                        phone: mobileController.text,
                        profileImage: user.profileImage)));
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text("updated")));
                toPage(context, const Profile());
              },
              text: "Submit",
            ),
          ],
        ),
      );
}

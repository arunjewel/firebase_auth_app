import 'package:flutter/material.dart';

import '../../core/constants.dart';
class CustomAppBar extends StatelessWidget {
  final String title;

  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kMainThemeColor,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: kSubThemeColor),
        onPressed: () => Navigator.of(context, rootNavigator: true).pop(context),
      ),
      title: Text(title),
    );
  }
}

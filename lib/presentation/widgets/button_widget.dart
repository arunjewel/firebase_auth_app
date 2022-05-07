import 'package:firebase_auth_app/core/constants.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
    margin:const  EdgeInsets.all(15),
    child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            onPrimary: kSubThemeColor,
            primary: kMainThemeColor,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          ),
          child: Text(text),
          onPressed: onClicked,
        ),
  );
}

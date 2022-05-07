import 'package:flutter/material.dart';

import '../../core/constants.dart';

class NetworkLoading extends StatelessWidget {
  const NetworkLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(kMainThemeColor),
        strokeWidth: 1.5,
      ),
    );
  }
}

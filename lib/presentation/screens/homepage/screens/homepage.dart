import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../profile/screens/profile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: null,
        backgroundColor: kMainThemeColor,
        title: const Text("Home"),
      ),
      body: const SafeArea(
        child: Center(
          child: Text("Map"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: kMainThemeColor,
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const Profile()));
          },
          child: const Center(
            child: Icon(Icons.add),
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:note_app/ui/components/appstyle.dart';
import 'package:note_app/ui/pages/home/home.dart';
import 'package:note_app/utils/colors.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2))
        .whenComplete(() => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const Home(),
            )));
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: primary,
        child: const Center(
          child: Text(
            "NoteApp",
            style: AppStyle.heading1,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AppNameWidget extends StatelessWidget {
  const AppNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 45, bottom: 55),
      child: Text(
        'Weather  App \nName',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 32,
            color: Color(0xFF303345),
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700),
      ),
    );
  }
}

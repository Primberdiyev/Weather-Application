import 'package:flutter/material.dart';
import 'package:weather_application/first_window/widgets/app_name_widget.dart';
import 'package:weather_application/first_window/widgets/find_button_widget.dart';
import 'package:weather_application/first_window/widgets/image_widget.dart';

class FirstWindow extends StatelessWidget {
  const FirstWindow({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: size.height * 0.15),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            const Color(0xFFFEE3BC),
            const Color(0xFFF39876).withOpacity(0.8)
          ], begin: Alignment.centerLeft, end: Alignment.centerRight),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageWidget(),
            AppNameWidget(),
            FindButtonWidget(),
          ],
        ),
      ),
    );
  }
}

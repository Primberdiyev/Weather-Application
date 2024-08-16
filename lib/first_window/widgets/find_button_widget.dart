import 'package:flutter/material.dart';
import 'package:weather_application/search_country_page/search_country_page.dart';

class FindButtonWidget extends StatelessWidget {
  const FindButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(context,MaterialPageRoute(builder: (context)=>SearchCountryPage()));
      },
      style: TextButton.styleFrom(
          minimumSize: const Size(250, 65),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor:  Color(0xFFFFFFFF).withOpacity(0.36)
         ),
      child: Text(
        'Click to find your town',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 18, color: const Color(0xFF303345).withOpacity(0.9)),
      ),
    );
  }
}

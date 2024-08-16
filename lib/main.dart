import 'package:flutter/material.dart';
import 'package:weather_application/my_app.dart';
import 'package:provider/provider.dart';
import 'package:weather_application/providers/country_provider.dart';
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountryProvider()),
      ],
      child: const MyApp(),
    ),
  );
}
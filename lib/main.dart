import 'package:bama_fruit/app/settings/theme_colors.dart';
import 'package:bama_fruit/app/views/register_view.dart';
import 'package:flutter/material.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'sans',
          scaffoldBackgroundColor: ThemeColors.scafuldBackgound,
          colorScheme: ColorScheme.fromSeed(seedColor: ThemeColors.primary),
          useMaterial3: true,
        ),
        home: RegisterView());
  }
}

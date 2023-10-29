import 'package:bama_fruit/app/settings/theme_colors.dart';
import 'package:bama_fruit/app/views/home_view.dart';
import 'package:bama_fruit/data/repositories/auth_repository.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
   authRepository.loadAuthInfo();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
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
        home:const HomeView());
  }
}

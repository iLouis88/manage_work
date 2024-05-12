import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:manage_work/features/bottom_bar/bottom_bar_screen.dart';
import 'package:manage_work/ultils/palette.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: GoogleFonts.quicksand().fontFamily,
        appBarTheme: const AppBarTheme(
          color: Palette.mainColor,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20),
       iconTheme: IconThemeData(
         color: Colors.white
       )
        ),
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
            .copyWith(background: Palette.backgroundColor),
      ),

      debugShowCheckedModeBanner: false,
      home: const BottomBarScreen(),
    );
  }
}

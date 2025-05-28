import 'package:flutter/material.dart';
import 'package:trabalho_2bi/theme/app_theme.dart';
import 'package:trabalho_2bi/ui/pages/home_page.dart';

void main() {
  runApp(
    MaterialApp(
      theme: AppTheme.lightTheme,
      home: HomePage(),
      title: "Animes",
      debugShowCheckedModeBanner: false,
    ),
  );
}

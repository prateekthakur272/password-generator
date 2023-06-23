import 'package:flutter/material.dart';
import 'package:password_genrator/screen/home.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  build(context) {
    return MaterialApp(
        home: const Home(),
        theme: ThemeData(
            primarySwatch: Colors.blueGrey,
            checkboxTheme: CheckboxThemeData(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
                fillColor: const MaterialStatePropertyAll<Color>(Colors.black),
                checkColor:
                    const MaterialStatePropertyAll<Color>(Colors.white)),
            listTileTheme: ListTileThemeData(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16))),
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16))))));
  }
}

void main(List<String> args) {
  runApp(const App());
}

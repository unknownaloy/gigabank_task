import 'package:flutter/material.dart';
import 'package:gigabank_task/screen/register_address_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gigabank Task',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF05f077),),
        useMaterial3: true,
      ),
      home: const RegisterAddressScreen(),
    );
  }
}

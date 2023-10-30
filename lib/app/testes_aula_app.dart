import 'package:flutter/material.dart';
import 'package:testes_aula/app/pages/register_page.dart';

class TestesAulaApp extends StatelessWidget {
  const TestesAulaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Testes Aula',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: const RegisterPage(),
    );
  }
}

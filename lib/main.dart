import 'package:flutter/material.dart';
import 'pages/visita_form_page.dart';

void main() {
  runApp(const MuseuApp());
}

class MuseuApp extends StatelessWidget {
  const MuseuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Cadastro de Visita em Museu',
      debugShowCheckedModeBanner: false,
      home: VisitaFormPage(),
    );
  }
}

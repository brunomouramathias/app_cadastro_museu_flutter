import 'package:flutter/material.dart';

class VisitaFormPage extends StatefulWidget {
  const VisitaFormPage({super.key});

  @override
  State<VisitaFormPage> createState() => _VisitaFormPageState();
}

class _VisitaFormPageState extends State<VisitaFormPage> {
  final responsavelController = TextEditingController();

  @override
  void dispose() {
    responsavelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Visita'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: responsavelController,
              decoration: const InputDecoration(
                labelText: 'Nome do responsável',
                helperText: 'Nome completo de quem assina pelo grupo',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Responsável: \${responsavelController.text}')),
                );
              },
              child: const Text('Testar captura'),
            ),
          ],
        ),
      ),
    );
  }
}

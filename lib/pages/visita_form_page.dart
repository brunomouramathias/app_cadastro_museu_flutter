import 'package:flutter/material.dart';

class VisitaFormPage extends StatefulWidget {
  const VisitaFormPage({super.key});

  @override
  State<VisitaFormPage> createState() => _VisitaFormPageState();
}

class _VisitaFormPageState extends State<VisitaFormPage> {
  final formKey = GlobalKey<FormState>();
  final responsavelController = TextEditingController();
  final quantidadeController = TextEditingController();

  void saveForm() {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Formulário válido!')),
    );
  }

  @override
  void dispose() {
    responsavelController.dispose();
    quantidadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro de Visita')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: responsavelController,
                  decoration: const InputDecoration(
                    labelText: 'Nome do responsável',
                    helperText: 'Nome completo de quem assina pelo grupo',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Informe o nome do responsável';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: quantidadeController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Quantidade de pessoas',
                    helperText: 'Digite apenas números inteiros maiores que zero',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.people),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Informe a quantidade';
                    final qtd = int.tryParse(value);
                    if (qtd == null) return 'Informe um número válido';
                    if (qtd <= 0) return 'A quantidade deve ser maior que zero';
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: saveForm,
                  icon: const Icon(Icons.save),
                  label: const Text('Salvar cadastro'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

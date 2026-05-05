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
  String? selectedGroupType;
  bool needsGuide = false;
  bool acceptedTerms = false;

  void saveForm() {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
    final guia = needsGuide ? 'Sim' : 'Não';
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Cadastro realizado!')),
    );
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Dados da Visita'),
        content: Text(
          'Responsável: \${responsavelController.text}\n'
          'Tipo de grupo: \$selectedGroupType\n'
          'Quantidade de pessoas: \${quantidadeController.text}\n'
          'Necessita de guia: \$guia',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Fechar'),
          ),
        ],
      ),
    );
  }

  void clearForm() {
    responsavelController.clear();
    quantidadeController.clear();
    setState(() {
      selectedGroupType = null;
      needsGuide = false;
      acceptedTerms = false;
    });
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
                    if (value == null || value.isEmpty) return 'Informe o nome do responsável';
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Tipo de grupo',
                    helperText: 'Selecione a categoria do grupo visitante',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.group),
                  ),
                  value: selectedGroupType,
                  items: const [
                    DropdownMenuItem(value: 'Escolar', child: Text('Escolar')),
                    DropdownMenuItem(value: 'Universitário', child: Text('Universitário')),
                    DropdownMenuItem(value: 'Turistas', child: Text('Turistas')),
                    DropdownMenuItem(value: 'Outros', child: Text('Outros')),
                  ],
                  onChanged: (value) => setState(() => selectedGroupType = value),
                  validator: (value) {
                    if (value == null) return 'Selecione o tipo de grupo';
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
                    if (qtd == 0) return 'A quantidade deve ser maior que zero';
                    if (qtd < 0) return 'A quantidade não pode ser negativa';
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                SwitchListTile(
                  title: const Text('Guia exclusivo'),
                  subtitle: const Text('Solicitar acompanhamento de um guia do museu'),
                  value: needsGuide,
                  activeColor: Colors.blue,
                  tileColor: needsGuide ? Colors.blue.withOpacity(0.08) : null,
                  onChanged: (value) => setState(() => needsGuide = value),
                ),
                const SizedBox(height: 8),
                CheckboxListTile(
                  title: const Text('Concordo com as regras de visitação'),
                  subtitle: const Text('Comprometo-me a zelar pelas obras expostas'),
                  value: acceptedTerms,
                  onChanged: (value) => setState(() => acceptedTerms = value ?? false),
                ),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: acceptedTerms ? saveForm : null,
                  icon: const Icon(Icons.save),
                  label: const Text('Salvar cadastro'),
                ),
                const SizedBox(height: 16),
                OutlinedButton(
                  onPressed: clearForm,
                  child: const Text('Limpar formulário'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

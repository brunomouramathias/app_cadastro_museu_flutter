# Cadastro de Visita em Museu

Aplicativo Flutter desenvolvido como parte das atividades da disciplina de Desenvolvimento Mobile da UTFPR. O objetivo foi construir um formulário completo de cadastro de visitantes para um museu, aplicando os controles de entrada de dados apresentados nos materiais DM-Controls-01, DM-Controls-02 e DM-Controls-03.

## Funcionalidades

- Captura e validação do nome do responsável pelo grupo com `TextFormField` e `TextEditingController`
- Seleção da categoria do grupo visitante via `DropdownButtonFormField` (Escolar, Universitário, Turistas, Outros)
- Campo numérico para quantidade de pessoas com validação de inteiro positivo
- Toggle de solicitação de guia exclusivo via `SwitchListTile`
- Aceite de regras de visitação via `CheckboxListTile`
- Botão de salvar desabilitado até que os termos sejam aceitos
- Resumo dos dados cadastrados em `AlertDialog` após submissão
- Limpeza do formulário via botão dedicado

## Tela principal

- **Cadastro de Visita:** Formulário completo com todos os controles de entrada, validação em tempo real e feedback visual ao usuário.

## Estrutura de Pastas

```
lib/
  main.dart                  # Ponto de entrada e configuração do MaterialApp
  pages/
    visita_form_page.dart    # Tela principal com o formulário, validadores e gerenciamento de estado
```

## Como rodar o projeto

1. **Clone o repositório:**
   ```sh
   git clone https://github.com/brunomouramathias/app_cadastro_museu_flutter.git
   cd app_cadastro_museu_flutter
   ```

2. **Instale as dependências:**
   ```sh
   flutter pub get
   ```

3. **Execute o aplicativo:**
   ```sh
   flutter run
   ```

## Tecnologias utilizadas

- [Flutter](https://flutter.dev/)
- [Dart](https://dart.dev/)
- `flutter/material.dart` - Componentes de Material Design

## Uso de Inteligência Artificial

Durante o desenvolvimento, utilizei ferramentas de IA como suporte pontual conforme o método CERTO abordado no plano da disciplina. Especificamente:

- **Contexto:** Desenvolvimento de formulário Flutter com validação de campos e controles booleanos.
- **Exigências:** Implementar os widgets `TextFormField`, `DropdownButtonFormField`, `SwitchListTile` e `CheckboxListTile` conforme os materiais DM-Controls-01 a 03.
- **Referências:** Materiais da disciplina e documentação oficial do Flutter.
- **Tarefa:** Consultas de sintaxe para o uso correto do `validator` em `DropdownButtonFormField` e para a lógica de desabilitar o botão condicionalmente via `onPressed: acceptedTerms ? saveForm : null`.
- **Observações:** Toda a estrutura, integração dos componentes, regras de validação e ciclo de vida dos controladores foram desenvolvidos e revisados manualmente. A IA foi usada exclusivamente para tirar dúvidas pontuais de sintaxe, não para gerar o código do projeto.

import 'package:flutter/material.dart';

class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final TextEditingController _userController = TextEditingController(); // Controlador para o campo de texto do usuário
  final TextEditingController _emailController = TextEditingController(); // Controlador para o campo de texto do email
  final TextEditingController _senhaController = TextEditingController(); // Controlador para o campo de texto da senha

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Voltar'), // Título da app bar para voltar
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                'Cadastre-se',
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextField(
              controller: _userController,
              decoration: InputDecoration(
                labelText: 'Usuário', // Rótulo para o campo de texto do usuário
                labelStyle: TextStyle(fontSize: 20.0), // Altera o tamanho da fonte para 20.0
              ),
            ),
            SizedBox(height: 16.0), // Espaçamento entre os campos de texto
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(fontSize: 20.0),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _senhaController,
              obscureText: true, // Configura o campo de texto da senha para ocultar o texto digitado
              decoration: InputDecoration(
                labelText: 'Senha',
                labelStyle: TextStyle(fontSize: 20.0),
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Navega de volta para a tela de login ao clicar no botão
                      Navigator.popUntil(context, ModalRoute.withName('/'));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[900], // Cor de fundo do botão
                    ),
                    child: Text(
                      'Finalizar Cadastro',
                      style: TextStyle(fontSize: 24.0),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _cadastrar() {
    String user = _userController.text; // Obtém o texto digitado no campo de texto do usuário
    String email = _emailController.text; // Obtém o texto digitado no campo de texto do email
    String senha = _senhaController.text; // Obtém o texto digitado no campo de texto da senha

    // Aqui você pode adicionar lógica de cadastro
    // Por enquanto, vamos apenas imprimir os dados
    print('User: $user');
    print('Email: $email');
    print('Senha: $senha');
  }
}

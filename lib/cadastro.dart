import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
                      _cadastrar();
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

  void _cadastrar() async{
    String user = _userController.text; // Obtém o texto digitado no campo de texto do usuário
    String email = _emailController.text; // Obtém o texto digitado no campo de texto do email
    String senha = _senhaController.text; // Obtém o texto digitado no campo de texto da senha

    try {
      await FirebaseFirestore.instance.collection('users').add({
        'username': user,
        'email': email,
        'password': senha,
      });
      //Mensagem de sucesso e navega para a tela de login
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Usuário cadastrado com sucesso!')),
      );
      Navigator.popUntil(context, ModalRoute.withName('login'));
    } catch (e) {
      // Exibe uma mensagem de erro
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao cadastrar usuário. Tente novamente.')),
      );
    }
  }
}

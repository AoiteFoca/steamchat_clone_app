import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';

class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final TextEditingController _userController = TextEditingController(); // Controlador para o campo de texto do usuário
  final TextEditingController _emailController = TextEditingController(); // Controlador para o campo de texto do email
  final TextEditingController _senhaController = TextEditingController(); // Controlador para o campo de texto da senha
  final TextEditingController _nicknameController = TextEditingController(); // Controlador para o campo de texto do nickname

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
            TextField(
              controller: _nicknameController,
              decoration: InputDecoration(
                labelText: 'Nickname',
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
    String email = _emailController.text;
    String senha = _senhaController.text;
    String nickname = _nicknameController.text;

    if (user.isEmpty || email.isEmpty || senha.isEmpty || nickname.isEmpty) {
      // Exibe uma mensagem de erro se algum campo estiver vazio
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, preencha todos os campos.')),
      );
      return;
    }

    try {
      bool isUserExists = await _checkUserExists(user);
      bool isEmailExists = await _checkEmailExists(email);
      bool isNicknameExists = await _checkNicknameExists(nickname);

      if (isUserExists) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Este usuário já está em uso. Por favor, escolha outro.')),
        );
        return;
      }

      if (isEmailExists) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Este email já está em uso. Por favor, use outro email.')),
        );
        return;
      }

      if (isNicknameExists) {
        nickname = await _generateUniqueNickname(nickname);
      }

      int userId = await _generateUniqueUserId();
      await FirebaseFirestore.instance.collection('users').doc(userId.toString()).set({
        'username': user,
        'email': email,
        'password': senha,
        'nickname': nickname,
      });
      // Mensagem de sucesso e navega para a tela de login
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

  Future<bool> _checkUserExists(String user) async {
    final querySnapshot = await FirebaseFirestore.instance.collection('users').where('username', isEqualTo: user).get();
    return querySnapshot.docs.isNotEmpty;
  }

  Future<bool> _checkEmailExists(String email) async {
    final querySnapshot = await FirebaseFirestore.instance.collection('users').where('email', isEqualTo: email).get();
    return querySnapshot.docs.isNotEmpty;
  }

  Future<bool> _checkNicknameExists(String nickname) async {
    final querySnapshot = await FirebaseFirestore.instance.collection('users').where('nickname', isEqualTo: nickname).get();
    return querySnapshot.docs.isNotEmpty;
  }

  Future<String> _generateUniqueNickname(String nickname) async {
    final random = Random();
    String newNickname = nickname;
    while (true) {
      newNickname = '$nickname${random.nextInt(10000)}'; // Adiciona um número aleatório ao nickname
      bool isNicknameExists = await _checkNicknameExists(newNickname);
      if (!isNicknameExists) {
        break;
      }
    }
    return newNickname;
  }

  Future<int> _generateUniqueUserId() async {
    final random = Random();
    bool isUnique = false;
    int userId = 0;

    while (!isUnique) {
      userId = random.nextInt(10000); // Gera um ID aleatório entre 0 e 9999

      // Verifica se o ID já existe no Firestore
      final snapshot = await FirebaseFirestore.instance.collection('users').doc(userId.toString()).get();
      if (!snapshot.exists) {
        isUnique = true;
      } else {
        // Incrementa o ID se já existir
        userId++;
      }
    }
    return userId;
  }
}
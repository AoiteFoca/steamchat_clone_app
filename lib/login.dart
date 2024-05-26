import 'package:flutter/material.dart';
import 'cadastro.dart';
import 'amigos.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controladores para os campos de entrada de usuário e senha
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                'LOGIN',
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _usernameController,
              // Controlador para o campo de usuário
              style: TextStyle(fontSize: 20.0),
              // Altera o tamanho da fonte para 20.0
              decoration: InputDecoration(
                labelText: 'Usuário',
                labelStyle: TextStyle(fontSize: 20.0),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              // Controlador para o campo de senha
              style: TextStyle(fontSize: 20.0),
              obscureText: true,
              // Oculta o texto digitado no campo de senha
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
                      // Navegar para a página de amigos ao pressionar o botão de login. Aqui é liberado dessa forma pois não temos integração com DB
                      _login();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.blue[900], // Cor de fundo do botão de login
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 24.0),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                // Navegar para a página de cadastro ao pressionar o botão de cadastro. Aqui é liberado dessa forma pois não temos integração com DB
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CadastroPage()),
                );
              },
              child: Text(
                "Não tem uma conta? Cadastre-se agora!",
                // Texto do botão de cadastro
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _login() async {
    String username = _usernameController.text;
    String password = _passwordController.text;

    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('username', isEqualTo: username)
          .get();

      if (snapshot.docs.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content:
                  Text('Usuário não encontrado. Verifique o nome de usuário.')),
        );
        return;
      }

      DocumentSnapshot userDoc = snapshot.docs.first;

      if (userDoc.exists) {
        dynamic userData = userDoc.data();
        if (userData != null && userData is Map<String, dynamic>) {
          String storedPassword = userData['password'];

          if (password == storedPassword) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text(
                      "Você entrou na sua conta! Seja bem vindo(a), $username")),
            );
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AmigosPage()),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content:
                      Text('Senha incorreta. Por favor, tente novamente.')),
            );
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content:
                    Text('Erro ao obter dados do usuário. Tente novamente.')),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content:
                  Text('Usuário não encontrado. Verifique o nome de usuário.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao fazer login. Tente novamente.')),
      );
    }
  }
}

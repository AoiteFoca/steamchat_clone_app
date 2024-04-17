import 'package:flutter/material.dart';
import 'login.dart'; // Importa a página de login
import 'amigos.dart'; // Importa a página de amigos
import 'conversas.dart'; // Importa a página de conversas
import 'grupos.dart'; // Importa a página de grupos
import 'addamigos.dart'; // Importa a página de adicionar amigos

/*ctrl+alt+l formata o codigo*/

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyApp', // Título do aplicativo
      initialRoute: '/login', // Define a rota inicial como a página de login
      routes: {
        '/login': (context) => LoginPage(), // Define a rota para a página de login
        '/amigos': (context) => AmigosPage(), // Define a rota para a página de amigos
        '/chat': (context) => ChatPage(), // Define a rota para a página de conversas
        '/grupos': (context) => GruposPage(), // Define a rota para a página de grupos
        '/addamigos': (context) => AddAmigosPage(), // Define a rota para a página de adicionar amigos
      },
      theme: ThemeData.light(), // Define o tema claro como padrão
      darkTheme: ThemeData.dark(), // Define o tema escuro
      themeMode: ThemeMode.dark, // Define o tema escuro como padrão
      home: LoginPage(), // Define a página de login como a página inicial
    );
  }
}

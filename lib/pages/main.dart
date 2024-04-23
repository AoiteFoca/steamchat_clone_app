import 'package:flutter/material.dart';
import 'login.dart';
import 'amigos.dart';
import 'conversas.dart';
import 'grupos.dart';
import 'addamigos.dart';

/*ctrl+alt+l formata o codigo*/

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyApp',
      initialRoute: '/login', // Define a rota inicial como a página de login
      routes: { //Definições de Rotas
        '/login': (context) => LoginPage(),
        '/amigos': (context) => AmigosPage(),
        '/chat': (context) => ChatPage(),
        '/grupos': (context) => GruposPage(),
        '/addamigos': (context) => AddAmigosPage(),
      },
      theme: ThemeData.light(), // Define o tema claro como padrão
      darkTheme: ThemeData.dark(), // Define o tema escuro
      themeMode: ThemeMode.dark, // Define o tema escuro como padrão
      home: LoginPage(), // Define a página de login como a página inicial
    );
  }
}

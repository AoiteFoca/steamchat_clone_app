import 'package:flutter/material.dart';
import 'perfil.dart';
import 'msg.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  int _selectedIndex = 1; // Índice inicial selecionado para "Conversas"

  // Simulação de lista de conversas (apenas uma conversa com Amigo_1 por enquanto)
  List<String> conversas = ['Chat com Amigo_1'];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0) {
        Navigator.pushReplacementNamed(context, '/amigos');
      } else if (index == 1) {
        Navigator.pushReplacementNamed(context, '/chat');
      } else if (index == 2) {
        Navigator.pushReplacementNamed(context, '/grupos');
      }
    });
  }

  void _navigateToMessage(String friendName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MessagePage(friendName: friendName), // Navegação para a página de mensagens com o nome do amigo
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conversas'),
        leading: IconButton(
          icon: Icon(Icons.menu), // Ícone do menu
          onPressed: () {
            // Navegação para a página de perfil
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PerfilPage()),
            );
          },
        ),
      ),
      body: ListView.builder(
        itemCount: conversas.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage('https://avatars.cloudflare.steamstatic.com/ef3717b96848bd0034c5ac7e6472b7cb256c051f_full.jpg'), // URL da imagem do amigo
            ),
            title: Text(conversas[index]), // Título da conversa
            onTap: () {
              // Ao clicar na conversa, navegue para a página de mensagens com o nome do amigo
              _navigateToMessage('Amigo_1'); // Simulação de conversa com Amigo_1
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped, // Função chamada ao clicar em um item da barra de navegação inferior
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.people), // Ícone para a página de amigos
            label: 'Amigos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat), // Ícone para a página de conversas
            label: 'Conversas', // Rótulo para a página de conversas (atual)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group), // Ícone para a página de grupos
            label: 'Grupos',
          ),
        ],
      ),
    );
  }
}

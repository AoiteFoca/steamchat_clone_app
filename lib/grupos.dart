import 'package:flutter/material.dart';
import 'perfil.dart';import 'amigos.dart';import 'conversas.dart';import 'grupomsg.dart';import 'novogrupo.dart';

class GruposPage extends StatefulWidget {
  final String userId; // Adicione um parâmetro userId
  GruposPage({required this.userId}); // Atualize o construtor
  @override
  _GruposPageState createState() => _GruposPageState();
}

class _GruposPageState extends State<GruposPage> {
  int _selectedIndex = 1; // Índice inicial selecionado para "Conversas"

  // Simulação de lista de conversas (apenas uma conversa com Amigo_1 por enquanto)
  List<String> grupos = ['Grupo Exemplo'];

  // Função para lidar com a navegação ao pressionar os itens da barra de navegação inferior
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Atualiza o índice selecionado
      if (index == 0) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => AmigosPage(userId: widget.userId), // Redireciona para a página de amigos
          ),
        );
      } else if (index == 1) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ChatPage(userId: widget.userId), // Redireciona para a página de chat
          ),
        );
      } else if (index == 2) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => GruposPage(userId: widget.userId), // Redireciona para a página de grupos
          ),
        );
      }
    });
  }

  // Função para navegar para a página de mensagens de grupo ao clicar em um grupo
  void _navigateToMessage(String groupname) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GMessagePage(groupname: groupname),
      ),
    );
  }

  // Função para navegar para a página de criação de novo grupo
  void _navigateToNovoGrupo() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NovoGrupoPage(),
      ),
    );
  }

  String userId = "ExId";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grupos'),
        leading: IconButton(
          icon: Icon(Icons.menu), // Ícone do menu
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PerfilPage(userId: widget.userId,)),
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.group_add), // Ícone para criar um novo grupo
            onPressed: () {
              _navigateToNovoGrupo();
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: grupos.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage('https://avatars.cloudflare.steamstatic.com/947edb77d1616923023e9ec0f0c400c0968267e6_full.jpg'), // URL da imagem do grupo
            ),
            title: Text(grupos[index]), // Nome do grupo
            onTap: () {
              // Ao clicar no grupo, navega para a página de mensagens de grupo
              _navigateToMessage(grupos[index]); // Passa o nome do grupo atual
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped, // Lidar com a navegação inferior
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Amigos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Conversas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Grupos',
          ),
        ],
      ),
    );
  }
}

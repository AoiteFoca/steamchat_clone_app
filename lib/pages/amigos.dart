import 'package:flutter/material.dart';
import 'perfil.dart';
import 'addamigos.dart';
import 'msg.dart';

class AmigosPage extends StatefulWidget {
  @override
  _AmigosPageState createState() => _AmigosPageState();
}

class _AmigosPageState extends State<AmigosPage> {
  int _selectedIndex =
      0; // Índice inicial selecionado para a bottom navigation bar
  bool _showOnlineList =
      true; // Variável para controlar a exibição da lista de amigos online
  bool _showOfflineList =
      true; // Variável para controlar a exibição da lista de amigos offline

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Atualiza o índice selecionado
      if (index == 0) {
        Navigator.pushReplacementNamed(
            context, '/amigos'); // Redireciona para a página de amigos
      } else if (index == 1) {
        Navigator.pushReplacementNamed(
            context, '/chat'); // Redireciona para a página de chat
      } else if (index == 2) {
        Navigator.pushReplacementNamed(
            context, '/grupos'); // Redireciona para a página de grupos
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Simulação de lista de amigos online e offline (Criação para auxílio visual)
    List<String> amigosOnline = [
      'Amigo_1',
      'Amigo_4',
      'Amigo_5',
      'Amigo_7',
      'Amigo_8',
      'Amigo_11'
    ];
    List<String> amigosOffline = [
      'Amigo_2',
      'Amigo_3',
      'Amigo_6',
      'Amigo_9',
      'Amigo_10'
    ];

    // Simulação de lista de amigos favoritos
    List<String> amigosFavoritos = [
      'Amigo_1',
      'Amigo_2',
      'Amigo_3',
      'Amigo_4',
      'Amigo_10',
      'Amigo_11'
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Meus Amigos'),
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
        actions: [
          IconButton(
            icon: Icon(Icons.person_add), // Ícone para adicionar amigo
            onPressed: () {
              // Redireciona para a página de adicionar amigos
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddAmigosPage()),
              );
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              children: [
                Text(
                  'Favoritos',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 100.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal, // Rolagem horizontal para lista dos amigos favoritos
              itemCount: amigosFavoritos.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      _navigateToChat(amigosFavoritos[
                          index]); // Navega para a página de mensagens ao clicar em um amigo favorito
                    },
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 45.0, // Tamanho do avatar
                          backgroundImage: NetworkImage(
                              'https://avatars.cloudflare.steamstatic.com/6c013217f7b34a9457bace435fff3c3de5b9e63a_full.jpg'), // URL da imagem do amigo
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              children: [
                Text(
                  'Online',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(_showOnlineList
                      ? Icons.arrow_drop_up
                      : Icons.arrow_drop_down),
                  // Ícone para expandir/recolher a lista de amigos online
                  onPressed: () {
                    setState(() {
                      _showOnlineList =
                          !_showOnlineList; // Alterna a visibilidade da lista de amigos online
                    });
                  },
                ),
              ],
            ),
          ),
          _showOnlineList
              ? Expanded(
                  child: ListView.builder(
                    itemCount: amigosOnline.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://avatars.cloudflare.steamstatic.com/4ab3db0761bdfb0b02c32de00e0924e1270cf81a_full.jpg'), // URL da imagem do amigo
                        ),
                        title: Text(amigosOnline[index]),
                        onTap: () {
                          _navigateToMessage(amigosOnline[
                              index]); // Navega para a página de mensagens ao clicar em um amigo online
                        },
                      );
                    },
                  ),
                )
              : SizedBox(),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              children: [
                Text(
                  'Offline',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(_showOfflineList
                      ? Icons.arrow_drop_up
                      : Icons.arrow_drop_down),
                  // Ícone para expandir/recolher a lista de amigos offline
                  onPressed: () {
                    setState(() {
                      _showOfflineList =
                          !_showOfflineList; // Alterna a visibilidade da lista de amigos offline
                    });
                  },
                ),
              ],
            ),
          ),
          _showOfflineList
              ? Expanded(
                  child: ListView.builder(
                    itemCount: amigosOffline.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://avatars.cloudflare.steamstatic.com/6f63d92c45959c7457bed199cc9a76dbd107faa3_full.jpg'), // URL da imagem do amigo
                        ),
                        title: Text(amigosOffline[index]),
                        onTap: () {
                          _navigateToMessage(amigosOffline[
                              index]); // Navega para a página de mensagens ao clicar em um amigo offline
                        },
                      );
                    },
                  ),
                )
              : SizedBox(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        // Índice selecionado na bottom navigation bar
        onTap: _onItemTapped,
        // Função chamada ao clicar em um item da bottom navigation bar
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.people), // Ícone para amigos
            label: 'Amigos', // Texto do item
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat), // Ícone para conversas
            label: 'Conversas', // Texto do item
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group), // Ícone para grupos
            label: 'Grupos', // Texto do item
          ),
        ],
      ),
    );
  }

  void _navigateToMessage(String friendName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MessagePage(
            friendName:
                friendName), // Navega para a página de mensagens com o nome do amigo selecionado
      ),
    );
  }

  void _navigateToChat(String friendName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MessagePage(
            friendName:
                friendName), // Navega para a página de chat com o nome do amigo selecionado
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'membrosgrupo.dart'; // Importe a página de membros do grupo

class GMessagePage extends StatelessWidget {
  final String groupname;

  GMessagePage({required this.groupname});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage('https://avatars.cloudflare.steamstatic.com/947edb77d1616923023e9ec0f0c400c0968267e6_full.jpg'), // URL da imagem do usuário
            ),
            SizedBox(width: 8), // Espaço entre o avatar e o texto
            Text('$groupname'),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.group), // Ícone para membros do grupo
            onPressed: () {
              // Redireciona para a página de membros do grupo
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MembrosGrupoPage()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(8),
              children: _buildMessages(), // Função para construir as mensagens
            ),
          ),
          _buildMessageComposer(),
        ],
      ),
    );
  }

  Widget _buildMessageComposer() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade900, // Alterado para cor escura
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.image, color: Colors.white), // Ícone em branco
              onPressed: () {
                // Adicionar lógica para enviar imagem
              },
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                  style: TextStyle(color: Colors.white), // Cor do texto em branco
                  decoration: InputDecoration(
                    hintText: 'Digite sua mensagem...',
                    hintStyle: TextStyle(color: Colors.white), // Cor do texto de dica em branco
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white), // Cor da borda em branco
                    ),
                  ),
                  textInputAction: TextInputAction.send,
                  maxLines: null, // Permite que o campo de texto cresça conforme o conteúdo
                  onSubmitted: (value) {
                    // Adicionar lógica para enviar mensagem de texto
                  },
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.send, color: Colors.white), // Ícone em branco
              onPressed: () {
                // Adicionar lógica para enviar mensagem de texto
              },
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildMessages() {
    // Simulação de mensagens
    List<Map<String, dynamic>> messages = [
      {'user': 'me', 'message': 'Eu adoro o $groupname!'},
      {'user': 'friend', 'message': 'Eu também!! Esse é meu grupo favorito!'},
      {'user': 'me', 'message': 'Só nós estamos aqui agora ☹️'},
      {'user': 'friend', 'message': '😪😪😪😪'},
      {'user': 'me', 'message': 'Daqui a pouco mais pessoas aparecem!!'},
      {'user': 'friend', 'message': 'Tomara! ☝️🤓'},
      // Adicione mais mensagens conforme necessário
    ];

    return messages.map((message) {
      return _buildMessage(message['user'], message['message']);
    }).toList();
  }

  Widget _buildMessage(String user, String message) {
    CrossAxisAlignment alignment =
    user == 'me' ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    Color color =
    user == 'friend' ? Colors.grey.shade800 : Colors.blue.shade900;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: alignment,
        children: [
          if (user == 'me')
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://avatars.cloudflare.steamstatic.com/8d1eebb8364ac6ecc76bd9d3e13ff8e9743816fd_full.jpg'), // Coloque a URL da imagem do amigo
            ),
          if (user == 'friend')
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://avatars.cloudflare.steamstatic.com/ef3717b96848bd0034c5ac7e6472b7cb256c051f_full.jpg'), // Coloque a URL da imagem do amigo
            ),
          SizedBox(width: 8), // Espaço entre o avatar e o texto da mensagem
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.7), // Cor da mensagem com opacidade
              borderRadius: BorderRadius.circular(8), // Borda arredondada
            ),
            child: Text(
              message,
              style: TextStyle(color: Colors.white), // Cor do texto branco
            ),
          ),
        ],
      ),
    );
  }
}

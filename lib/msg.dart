import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  final String friendName;

  MessagePage({required this.friendName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://avatars.cloudflare.steamstatic.com/ef3717b96848bd0034c5ac7e6472b7cb256c051f_full.jpg'), // URL da imagem do usuário
            ),
            SizedBox(width: 8), // Espaço entre o avatar e o texto
            Text(' $friendName'), // Exibe o nome do amigo na barra de título
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(8),
              children:
                  _buildMessages(), // Chama a função para construir as mensagens
            ),
          ),
          _buildMessageComposer(),
          // Chama a função para construir o campo de composição de mensagem
        ],
      ),
    );
  }

  Widget _buildMessageComposer() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade900, // Define a cor de fundo do campo de composição de mensagem
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
              icon: Icon(Icons.image, color: Colors.white), // Ícone para enviar imagem
              onPressed: () {
                // Lógica para enviar imagem
              },
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Digite sua mensagem...',
                    hintStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.white),
                    ),
                  ),
                  textInputAction: TextInputAction.send,
                  maxLines: null,
                  // Permite que o campo de texto cresça conforme o conteúdo
                  onSubmitted: (value) {
                    //Lógica para enviar mensagem de texto
                  },
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.send, color: Colors.white),
              // Ícone para enviar mensagem de texto
              onPressed: () {
                //Lógica para enviar mensagem de texto
              },
            ),
          ],
        ),
      ),
    );
  }

  // Função para construir as mensagens
  List<Widget> _buildMessages() {
    // Simulação de mensagens (Apenas Visualização)
    List<Map<String, dynamic>> messages = [
      {'user': 'me', 'message': 'Olá, $friendName como você está?'},
      {'user': 'friend', 'message': 'Oi! Estou bem, e você?'},
      {'user': 'me', 'message': 'Que bom que você está bem :D'},
      {'user': 'friend', 'message': 'E aí? Quer jogar um game hoje?'},
      {'user': 'me', 'message': 'Qual jogo? 🤨🎮'},
      {'user': 'friend', 'message': 'Podemos jogar um CS?'},
      {'user': 'me', 'message': 'Pode ser!! Logo mais te chamo pro game!!'},
      {'user': 'friend', 'message': 'Beleza! 😎'},
    ];

    return messages.map((message) {
      return _buildMessage(message['user'],
          message['message']); // Chama a função para construir cada mensagem
    }).toList();
  }

  // Função para construir cada mensagem
  Widget _buildMessage(String user, String message) {
    // Determina a direção da mensagem com base no usuário
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
                  'https://avatars.cloudflare.steamstatic.com/8d1eebb8364ac6ecc76bd9d3e13ff8e9743816fd_full.jpg'), // URL da imagem do amigo
            ),
          if (user == 'friend')
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://avatars.cloudflare.steamstatic.com/ef3717b96848bd0034c5ac7e6472b7cb256c051f_full.jpg'), // URL da imagem do amigo
            ),
          SizedBox(width: 8), // Espaço entre o avatar e o texto da mensagem
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.7),
              // Define a cor de fundo da caixa de mensagem com base no usuário
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              message, // Exibe o texto da mensagem
              style: TextStyle(
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
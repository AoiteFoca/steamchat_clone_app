import 'package:flutter/material.dart';

class MembrosGrupoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Voltar ao Grupo'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 16), // Espaço em branco
          SizedBox(height: 8), // Espaço em branco
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.person_add), // Ícone para adicionar amigo ao grupo
                  onPressed: () {
                    //Lógica para adicionar o amigo ao grupo
                  },
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Adicionar Amigos ao Grupo',
                      border: OutlineInputBorder(), // Borda do campo de texto
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.search), // Ícone para buscar membros no grupo
                  onPressed: () {
                    //Lógica para buscar membros no grupo
                  },
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Buscar Membros no Grupo',
                      border: OutlineInputBorder(), // Borda do campo de texto
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          Text(
            'Membros do Grupo',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16), // Espaço em branco
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: _buildMemberItem(
              'https://avatars.cloudflare.steamstatic.com/8d1eebb8364ac6ecc76bd9d3e13ff8e9743816fd_full.jpg', // URL da imagem do membro
              'Makolindo', // Nome do membro
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: _buildMemberItem(
              'https://avatars.cloudflare.steamstatic.com/ef3717b96848bd0034c5ac7e6472b7cb256c051f_full.jpg', // URL da imagem do membro
              'Amigo_1', // Nome do membro
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMemberItem(String imageUrl, String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          SizedBox(width: 16), // Espaço à esquerda
          CircleAvatar(
            radius: 20, // Raio do avatar
            backgroundImage: NetworkImage(imageUrl), // Imagem do avatar
          ),
          SizedBox(width: 16), // Espaço entre o avatar e o nome do membro
          Text(
            name, // Nome do membro
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

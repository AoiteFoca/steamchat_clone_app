import 'package:flutter/material.dart';

class NovoGrupoPage extends StatefulWidget {
  @override
  _NovoGrupoPageState createState() => _NovoGrupoPageState();
}

class _NovoGrupoPageState extends State<NovoGrupoPage> {
  List<bool> _isSelected =
      List.generate(10, (_) => false); // Lista de estado das caixas de seleção

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Voltar'), // Título da barra de navegação
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText:
                    'Nome do Grupo', // Rótulo para o campo de entrada do nome do grupo
              ),
            ),
            SizedBox(height: 10), // Espaçamento
            ElevatedButton(
              onPressed: () {
                // Adicionar lógica para selecionar uma foto
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors
                    .blue[900], // Define a cor de fundo do botão como azul
              ),
              child: Text(
                  'Selecionar Foto'), // Texto do botão para selecionar foto
            ),
            ListTile(
              leading: Icon(Icons.search), // Ícone de busca
              title: TextField(
                decoration: InputDecoration(
                  hintText:
                      'Buscar por nome de amigo', // Dica de texto para o campo de busca
                ),
              ),
            ),
            Divider(), // Linha divisória
            Text(
              'Membros do Grupo', // Título para a lista de membros do grupo
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10), // Espaçamento
            Expanded(
              child: ListView.builder(
                itemCount: 10, // Número de amigos na lista
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      // Lista de amigos com opção para selecionar membros do grupo
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey[800],
                          // Cor de fundo temporária para o avatar
                          child: Icon(Icons.person), // Ícone de usuário
                        ),
                        title: Text('Amigo ${index + 1}'), // Nome do amigo
                        trailing: Checkbox(
                          value: _isSelected[index],
                          // Estado da caixa de seleção
                          onChanged: (value) {
                            setState(() {
                              _isSelected[index] =
                                  value!; // Atualiza o estado da caixa de seleção
                            });
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 20), // Espaçamento
            ElevatedButton(
              onPressed: () {
                // Adicionar lógica para criar o grupo
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors
                    .blue[900], // Define a cor de fundo do botão como azul
              ),
              child: Text('Criar Grupo'), // Texto do botão para criar o grupo
            ),
          ],
        ),
      ),
    );
  }
}
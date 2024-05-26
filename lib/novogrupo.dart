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
        title: Text('Voltar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText:
                    'Nome do Grupo',
              ),
            ),
            SizedBox(height: 10), // Espaçamento
            ElevatedButton(
              onPressed: () {
                //Lógica para selecionar uma foto
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[900],
              ),
              child: Text(
                  'Selecionar Foto'), // Texto do botão para selecionar foto
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: TextField(
                decoration: InputDecoration(
                  hintText:
                      'Buscar por nome de amigo',
                ),
              ),
            ),
            Divider(), // Linha divisória
            Text(
              'Membros do Grupo',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
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
                          child: Icon(Icons.person),
                        ),
                        title: Text('Amigo ${index + 1}'), // Nome do amigo testes
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
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Lógica para criar o grupo
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors
                    .blue[900],
              ),
              child: Text('Criar Grupo'),
            ),
          ],
        ),
      ),
    );
  }
}
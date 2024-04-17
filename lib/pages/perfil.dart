import 'package:flutter/material.dart';
import 'addamigos.dart'; // Importa a página de adicionar amigos

class PerfilPage extends StatefulWidget {
  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  String _status = 'Online'; // Define o status padrão

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'), // Define o título da página
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Row(
            children: [
              // Parte esquerda deslizante (Drawer)
              Container(
                width: constraints.maxWidth * 0.75,
                // Define a largura do Drawer como 75% da largura total
                child: Drawer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Espaço para a foto de usuário e informações do perfil
                      Expanded(
                        child: Container(
                          color: Colors.grey[900],
                          // Define a cor de fundo temporária
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Foto de perfil
                                Container(
                                  padding: const EdgeInsets.all(4.0),
                                  // Ajusta o padding conforme necessário
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: _getBorderColor(),
                                        width:
                                            4.0), // Personaliza a cor e a largura da borda conforme necessário
                                  ),
                                  child: CircleAvatar(
                                    radius: constraints.maxWidth * 0.15,
                                    // Define o raio do avatar como 15% da largura total
                                    backgroundImage: NetworkImage(
                                      'https://avatars.cloudflare.steamstatic.com/8d1eebb8364ac6ecc76bd9d3e13ff8e9743816fd_full.jpg',
                                    ),
                                    // Define a imagem de perfil
                                    backgroundColor: Colors.transparent,
                                    foregroundColor: _getBorderColor(),
                                    child: Text(''),
                                  ),
                                ),
                                SizedBox(height: 16.0),
                                // Espaçamento
                                // Nome do usuário
                                Text(
                                  'Makolindo Monstro',
                                  style: TextStyle(
                                      fontSize: constraints.maxWidth * 0.05,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: constraints.maxWidth * 0.1),
                                // Espaçamento
                                // Título "Status"
                                Text(
                                  'Status',
                                  style: TextStyle(
                                      fontSize: constraints.maxWidth * 0.050),
                                ),
                                SizedBox(height: constraints.maxWidth * 0.01),
                                // Espaçamento
                                // Botões de alternância para selecionar o status
                                OutlinedButton(
                                  onPressed: () {
                                    setState(() {
                                      _status = 'Online';
                                    });
                                  },
                                  child: Text('Online'),
                                  // Texto do botão "Online"
                                  style: ButtonStyle(
                                    // Estiliza o botão conforme o status atual
                                    side: MaterialStateProperty.resolveWith<
                                        BorderSide>(
                                      (Set<MaterialState> states) {
                                        if (_status == 'Online') {
                                          return BorderSide(
                                            color: Colors.blue,
                                          );
                                        } else {
                                          return BorderSide(
                                            color: Colors.transparent,
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(height: constraints.maxWidth * 0.01),
                                // Espaçamento
                                OutlinedButton(
                                  onPressed: () {
                                    setState(() {
                                      _status = 'Ocupado';
                                    });
                                  },
                                  child: Text('Ocupado'),
                                  // Texto do botão "Ocupado"
                                  style: ButtonStyle(
                                    // Estiliza o botão conforme o status atual
                                    side: MaterialStateProperty.resolveWith<
                                        BorderSide>(
                                      (Set<MaterialState> states) {
                                        if (_status == 'Ocupado') {
                                          return BorderSide(
                                            color: Colors.blue,
                                          );
                                        } else {
                                          return BorderSide(
                                            color: Colors.transparent,
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(height: constraints.maxWidth * 0.01),
                                // Espaçamento
                                OutlinedButton(
                                  onPressed: () {
                                    setState(() {
                                      _status = 'Invisível';
                                    });
                                  },
                                  child: Text('Invisível'),
                                  // Texto do botão "Invisível"
                                  style: ButtonStyle(
                                    // Estiliza o botão conforme o status atual
                                    side: MaterialStateProperty.resolveWith<
                                        BorderSide>(
                                      (Set<MaterialState> states) {
                                        if (_status == 'Invisível') {
                                          return BorderSide(
                                            color: Colors.blue,
                                          );
                                        } else {
                                          return BorderSide(
                                            color: Colors.transparent,
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Opções na parte inferior do Drawer
                      ListTile(
                        leading: Icon(Icons.person_add),
                        // Ícone para adicionar amigo
                        title: Text('Adicionar Amigo'),
                        // Texto para adicionar amigo
                        onTap: () {
                          // Redireciona para a página de adicionar amigos
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddAmigosPage()),
                          );
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.exit_to_app),
                        // Ícone para sair da conta
                        title: Text('Sair'),
                        // Texto para sair da conta
                        onTap: () {
                          // Navega de volta para a tela de login
                          Navigator.popUntil(context, ModalRoute.withName('/'));
                        },
                      ),
                    ],
                  ),
                ),
              ),
              // Parte direita (Placeholder)
              Expanded(
                child: Container(
                  color: Colors.transparent, // Cor de fundo temporária
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Color _getBorderColor() {
    // Função para retornar a cor da borda com base no status atual
    switch (_status) {
      case 'Online':
        return Colors.blue.shade700;
      case 'Ocupado':
        return Colors.red.shade700;
      case 'Invisível':
        return Colors.grey;
      default:
        return Colors.transparent; // Padrão: sem borda para garantir
    }
  }
}
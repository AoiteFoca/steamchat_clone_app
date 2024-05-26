import 'package:flutter/material.dart';
import 'addamigos.dart';

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
        title: Text('Perfil'),
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
                                    //Imagem de perfil
                                    backgroundColor: Colors.transparent,
                                    foregroundColor: _getBorderColor(),
                                    child: Text(''),
                                  ),
                                ),
                                SizedBox(height: 16.0),// Espaçamento
                                Text(
                                  'Teste Nome',
                                  style: TextStyle(
                                      fontSize: constraints.maxWidth * 0.05,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: constraints.maxWidth * 0.1), // Espaçamento
                                Text(
                                  'Status',
                                  style: TextStyle(
                                      fontSize: constraints.maxWidth * 0.050),
                                ),
                                SizedBox(height: constraints.maxWidth * 0.01),
                                // Botões de alternância para selecionar o status
                                OutlinedButton(
                                  onPressed: () {
                                    setState(() {
                                      _status = 'Online';
                                    });
                                  },
                                  child: Text('Online'),
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
                                OutlinedButton(
                                  onPressed: () {
                                    setState(() {
                                      _status = 'Ocupado';
                                    });
                                  },
                                  child: Text('Ocupado'),
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
                                OutlinedButton(
                                  onPressed: () {
                                    setState(() {
                                      _status = 'Invisível';
                                    });
                                  },
                                  child: Text('Invisível'),
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
                        title: Text('Adicionar Amigo'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddAmigosPage()),
                          );
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.exit_to_app),
                        title: Text('Sair'),
                        onTap: () {
                          Navigator.popUntil(context, ModalRoute.withName('login'));
                        },
                      ),
                    ],
                  ),
                ),
              ),
              // Parte direita (Placeholder). Ver como melhorar isso
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
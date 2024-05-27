import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'addamigos.dart';

class PerfilPage extends StatefulWidget {
  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  String _status = 'Online'; // Define o status padrão
  String _nickname = ' ';
  String _photoUrl = 'https://www.roadsideamerica.com/attract/images/wi/WILACbluebaby_amber.jpg';
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _photoUrlController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final String _userId = '4701'; // ID fictício do usuário

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    DocumentSnapshot userDoc = await _firestore.collection('users').doc(_userId).get();
    if (userDoc.exists) {
      setState(() {
        _nickname = userDoc['nickname'] ?? 'Nickname';
        _photoUrl = userDoc['photoUrl'] ?? _photoUrl;
        _status = userDoc['status'] ?? 'Offline';
        _nicknameController.text = _nickname;
        _photoUrlController.text = _photoUrl;
      });
    }
  }

  Future<void> _updateStatus(String status) async {
    await _firestore.collection('users').doc(_userId).update({'status': status});
    setState(() {
      _status = status;
    });
  }

  Future<void> _updateProfile() async {
    await _firestore.collection('users').doc(_userId).update({
      'nickname': _nicknameController.text,
      'photoUrl': _photoUrlController.text,
    });
    setState(() {
      _nickname = _nicknameController.text;
      _photoUrl = _photoUrlController.text;
    });
    Navigator.pop(context); // Fechar o modal após a atualização
  }

  Future<void> _deleteAccount() async {
    await _firestore.collection('users').doc(_userId).delete();
  }

  Future<void> _logout() async {
    Navigator.popUntil(context, ModalRoute.withName('login'));
  }

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
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Espaço para a foto de usuário e informações do perfil
                        Container(
                          color: Colors.grey[900],
                          padding: EdgeInsets.all(16.0),
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
                                      width: 4.0, // Personaliza a cor e a largura da borda conforme necessário
                                    ),
                                  ),
                                  child: CircleAvatar(
                                    radius: constraints.maxWidth * 0.15,
                                    // Define o raio do avatar como 15% da largura total
                                    backgroundImage: NetworkImage(_photoUrl),
                                    backgroundColor: Colors.transparent,
                                    foregroundColor: _getBorderColor(),
                                    child: Text(''),
                                  ),
                                ),
                                SizedBox(height: 16.0), // Espaçamento
                                Text(
                                  _nickname,
                                  style: TextStyle(
                                      fontSize: constraints.maxWidth * 0.05,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: constraints.maxWidth * 0.1), // Espaçamento
                                Text(
                                  'Status',
                                  style: TextStyle(fontSize: constraints.maxWidth * 0.050),
                                ),
                                SizedBox(height: constraints.maxWidth * 0.01),
                                // Botões de alternância para selecionar o status
                                OutlinedButton(
                                  onPressed: () {
                                    _updateStatus('Online');
                                  },
                                  child: Text('Online'),
                                  style: ButtonStyle(
                                    side: MaterialStateProperty.resolveWith<BorderSide>(
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
                                    _updateStatus('Ocupado');
                                  },
                                  child: Text('Ocupado'),
                                  style: ButtonStyle(
                                    side: MaterialStateProperty.resolveWith<BorderSide>(
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
                                    _updateStatus('Invisível');
                                  },
                                  child: Text('Invisível'),
                                  style: ButtonStyle(
                                    side: MaterialStateProperty.resolveWith<BorderSide>(
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
                        // Opções na parte inferior do Drawer
                        ListTile(
                          leading: Icon(Icons.person_add),
                          title: Text('Adicionar Amigo'),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AddAmigosPage()),
                            );
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.settings),
                          title: Text('Configurar Conta'),
                          onTap: () {
                            _showEditProfileModal();
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.exit_to_app),
                          title: Text('Sair'),
                          onTap: () {
                            _showLogoutConfirmation();
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.delete_forever),
                          title: Text('Apagar Conta'),
                          onTap: () {
                            _showDeleteAccountConfirmation();
                          },
                        ),
                      ],
                    ),
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

  void _showEditProfileModal() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Editar Perfil'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextField(
                  controller: _nicknameController,
                  decoration: InputDecoration(labelText: 'Nickname'),
                ),
                TextField(
                  controller: _photoUrlController,
                  decoration: InputDecoration(labelText: 'Foto (URL)'),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Salvar'),
              onPressed: () {
                _updateProfile();
              },
            ),
          ],
        );
      },
    );
  }

  void _showLogoutConfirmation() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmação de Saída'),
          content: Text('Você realmente quer sair da sua conta?'),
          actions: <Widget>[
            TextButton(
              child: Text('Não'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Sim'),
              onPressed: () {
                _logout();
              },
            ),
          ],
        );
      },
    );
  }

  void _showDeleteAccountConfirmation() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmação de Exclusão'),
          content: Text('Você realmente quer apagar sua conta? Esta ação não pode ser desfeita.'),
          actions: <Widget>[
            TextButton(
              child: Text('Não'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Sim'),
              onPressed: () {
                _deleteAccount();
                Navigator.popUntil(context, ModalRoute.withName('login'));
              },
            ),
          ],
        );
      },
    );
  }
}

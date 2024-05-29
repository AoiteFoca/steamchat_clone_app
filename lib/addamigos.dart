import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; //Import para utilizar a área de transferência

class AddAmigosPage extends StatelessWidget {
  final String userId; // Adicione um parâmetro userId
  AddAmigosPage({required this.userId}); // Atualize o construtor
  @override
  Widget build(BuildContext context) {
    String codigoAmigo = 'XLR8666'; // Código do amigo para copiar
    return Scaffold(
      appBar: AppBar(
        title: Text('Voltar'),
      ),
      backgroundColor: Colors.grey[900], // Cor de fundo da tela
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20.0), // Preenchimento interno do contêiner
          width: MediaQuery.of(context).size.width * 0.8, // Largura do contêiner (80% da largura da tela). Verificar depois se há como otimizar
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 08.0), // Adiciona espaço em branco apenas na parte superior
                  child: Text(
                    'Adicionar Amigo', // Título principal da página
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0), // Espaçamento vertical
              Text(
                'Seu código de amigo:', // Título para o código do usuário
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'XLR8666', // Exemplo de código de amigo
                      ),
                    ),
                  ),
                  SizedBox(width: 8.0), // Espaçamento horizontal
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[900], // Cor de fundo do botão
                    ),
                    onPressed: () {
                      // Lógica para copiar o código para a área de transferência
                      Clipboard.setData(ClipboardData(text: codigoAmigo));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Código copiado para a área de transferência')),
                      );
                    },
                    child: Text('Copiar'), // Texto do botão
                  ),
                ],
              ),
              SizedBox(height: 35.0),
              Text(
                'Informar código do amigo:', // Local para inserir o código do amigo a ser adicionado
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Informe o código do amigo', //Aqui é a criação da hint para dar uma "dica" ao usuário
                ),
              ),
              SizedBox(height: 16.0), // Espaçamento vertical
              Text(
                'Ou busque pelo usuário:', // Buscar o amigo pelo nome de usuário
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Informe o Username do amigo', //Criação da hint para dar uma "dica" ao usuário
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[900], // Cor de fundo do botão
                ),
                onPressed: () {
                  // Lógica para buscar o amigo
                },
                child: Text('Buscar'), // Texto do botão de busca
              ),
            ],
          ),
        ),
      ),
    );
  }
}

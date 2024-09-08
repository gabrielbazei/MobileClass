import 'package:flutter/material.dart';
import 'package:tarefa5/Principal.dart';

class Cadastro extends StatelessWidget {
  // Controladores para capturar o texto dos campos de texto
  final TextEditingController _campoNome = TextEditingController();
  final TextEditingController _campoEmail = TextEditingController();
  final TextEditingController _campoSenha = TextEditingController();
  final TextEditingController _campoSenha2 = TextEditingController();

  // Função que dispara o alerta com o conteúdo dos campos
  @override
  Widget build(BuildContext context) {
    void _showAlert() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Dados cadastrados: '),
            content: Text(
                "Nome ${_campoNome.text} \n Email ${_campoEmail.text} \n Senha ${_campoSenha.text} \n Senha2 ${_campoSenha2.text}"),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Fecha o alerta
                  if (_campoSenha.text != _campoSenha2.text &&
                      _campoSenha.text == "") {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Senha incorreta'),
                          content: Text("As senhas digitadas não conferem!"),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Fecha o alerta
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  } else if (_campoEmail.text == "") {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Email em Branco'),
                          content: Text("O email está em branco!"),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Fecha o alerta
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyApp()));
                  }
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
      /*if (_campoSenha.text() == _campoSenha2.toString() &&
          _campoEmail != "") {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyApp()));
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Senha incorreta'),
              content: Text("A senha digitada é incorreta, tente novamente!"),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Fecha o alerta
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }*/
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'), // Título da AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Espaçamento ao redor do corpo
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centraliza na tela
          children: <Widget>[
            // Primeiro campo de texto
            TextField(
              controller: _campoNome,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            const SizedBox(height: 10), // Espaçamento entre os campos
            // Segundo campo de texto
            TextField(
              obscureText: true,
              controller: _campoEmail,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 10),
            TextField(
              obscureText: true,
              controller: _campoSenha,
              decoration: InputDecoration(labelText: 'Senha'),
            ),
            const SizedBox(height: 10),
            TextField(
              obscureText: true,
              controller: _campoSenha2,
              decoration: InputDecoration(labelText: 'Confirme a senha'),
            ),
            const SizedBox(height: 32), // Espaçamento antes do botão
            // Botão que dispara o alerta
            ElevatedButton(
              onPressed: _showAlert, // Chama a função de alerta
              child: const Text('Cadastro'),
            ),
          ],
        ),
      ),
    );
  }
}

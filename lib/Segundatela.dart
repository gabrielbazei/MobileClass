import 'package:flutter/material.dart';

class SegundaTela extends StatelessWidget {
  final String usuario;
  SegundaTela({required this.usuario});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Segunda Tela'),
      ),
      body: Center(
        child: Text('Olá Seja bem vindo $usuario'),
      ),
    );
  }
}

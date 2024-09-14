import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  final String? texto;
  final void Function() aoClicar;

  const Botao(this.texto, this.aoClicar, {super.key});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black, foregroundColor: Colors.white),
      onPressed: aoClicar,
      child: Text(texto!),
    );
  }
}

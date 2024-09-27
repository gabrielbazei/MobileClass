import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tarefa6/presenter/presenter.dart';

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculo de notas',
      home: CalculadoraNotasView(),
    );
  }
}

class CalculadoraNotasView extends StatefulWidget {
  @override
  _CalculadoraNotasViewState createState() => _CalculadoraNotasViewState();
}

class _CalculadoraNotasViewState extends State<CalculadoraNotasView>
    implements CalculadoraNotasContractView {
  late CalculadoraNotasPresenter _presenter;
  String _tarefaAtual = '';
  String _textfinal = '';
  String _txtBotao = '';
  final TextEditingController _notaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _presenter = CalculadoraNotasPresenter(this);
    _presenter.iniciar();
  }

  @override
  void atualizarTarefaAtual(String titulo) {
    setState(() {
      _tarefaAtual = titulo;
    });
  }

  @override
  void atualizarBotao(String texto) {
    setState(() {
      _txtBotao = texto;
    });
  }

  @override
  void mostrarNotaFinal(String texto) {
    setState(() {
      _textfinal = texto;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('App para calculo de notas')),
      body: Column(
        children: [
          Text(
            "Insira a nota do aluno para a tarefa: $_tarefaAtual",
            style: const TextStyle(
                fontWeight: FontWeight.normal,
                fontFamily: "arial",
                fontSize: 15),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            width: 400,
            child: TextField(
              controller: _notaController,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(5),
                labelText: 'Informe nota do aluno',
                border: OutlineInputBorder(),
              ),
              maxLines: 1,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              _presenter.calcNota(_notaController.text);
            },
            child: Text(_txtBotao),
          ),
          Text(
            _textfinal,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ],
      ),
    );
  }
}

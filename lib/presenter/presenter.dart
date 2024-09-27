import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:tarefa6/model/model.dart';

abstract class CalculadoraNotasContractView {
  void atualizarTarefaAtual(String titulo);
  void atualizarBotao(String texto);
  void mostrarNotaFinal(String texto);
}

class CalculadoraNotasPresenter {
  final CalculadoraNotasContractView _view;
  List<Tarefa> _tarefas = [];
  int _cont = 0;
  final List<double> _notas = [];

  CalculadoraNotasPresenter(this._view);
  //inicializa o app
  Future<void> iniciar() async {
    _tarefas = await _lerTarefas();
    _view.atualizarTarefaAtual(_tarefas[_cont].tituloResumido);
    _view.atualizarBotao("Submeter ir para a proxima tarefa");
  }

  //Puxa as tarefas do json
  Future<List<Tarefa>> _lerTarefas() async {
    final String response = await rootBundle.loadString('assets/notas.json');
    final List<dynamic> data = json.decode(response);
    return data.map((json) => Tarefa.fromJson(json)).toList();
  }

  void calcNota(String valorStr) {
    double nota_final = 0;
    double MPC = 0;
    //puxa o valor informado e o converte para double
    double valor = double.parse(valorStr);
    //se o valor for menor que 4 adiciona no cont
    if (_cont < _tarefas.length - 1) {
      _cont++;
    }
    //Isto mede o tamanho da nota com base no tamanho que ela precisa preencher
    //Caso ela esteja menos que 2, ou seja, entrando para a ultima tarefa ela muda o texto do botão
    if (_notas.length == _tarefas.length - 2) {
      _view.atualizarBotao("Submeter notas e calcular a nota final");
    }
    //Calculo solicitado pelo professor
    if (_notas.length == _tarefas.length - 1) {
      _notas.add(valor);
      for (int i = 0; i < _notas.length - 1; i++) {
        MPC = (_notas[i] / 10 * 3 * _tarefas[i].peso) / _tarefas[i].peso;
      }
      //Calculo da nota final e atualiza
      nota_final = MPC + (_notas[_notas.length - 1] / 10 * 7);
      _view.mostrarNotaFinal("\n A nota final do aluno foi: $nota_final");
    } else {
      //Caso nada aconteça ela adiciona o valor informado pelo usuario para a lista de notas
      _notas.add(valor);
    }
    //por algum motivo, o texto de qual tarefa atualiza caso isto esteja aqui, mesmo utilizando "tarefa = dado[cont]["tituloResumido"];" não atualizava o suficiente
    _lerTarefas();
    //Atualiza o texto da tarefa atual
    _view.atualizarTarefaAtual(_tarefas[_cont].tituloResumido);
  }
}

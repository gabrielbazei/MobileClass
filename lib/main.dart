import 'package:flutter/material.dart';
import 'package:tarefa6/view/view.dart';

void main() {
  runApp(MeuApp());
}


//Codigo antigo
/*import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

void main() {
  runApp(MeuApp());
}

class MeuAppState extends State<MeuApp> {
  //inicializa Variaveis
  List dado = [];
  int cont = 0;
  String tarefa = "";
  String txtBotao = "";
  String textfinal = "   ";
  final TextEditingController notaAluno = TextEditingController();
  final notas = <double>[];

//Função para ler os dados do Json e inicializa a variavel Tarefa, que é utilizada para o texto de qual tarefa é
  Future<void> leitor() async {
    final String response = await rootBundle.loadString('assets/notas.json');
    final data = await json.decode(response);
    setState(() {
      dado = data;
    });
    tarefa = dado[cont]["tituloResumido"];
  }

  //Função principal chamada toda vez que o botão é apertado
  void calcNota() {
    double nota_final = 0;
    double MPC = 0;
    //puxa o valor informado e o converte para double
    double valor = double.parse(notaAluno.text);
    //se o valor for menor que 4 adiciona no cont
    if (cont < dado.length - 1) {
      cont++;
    }
    //Isto mede o tamanho da nota com base no tamanho que ela precisa preencher
    //Caso ela esteja menos que 2, ou seja, entrando para a ultima tarefa ela muda o texto do botão
    if (notas.length == dado.length - 2) {
      txtBotao = "Submeter notas e calcular a nota final";
    }
    //Calculo solicitaod pelo professor
    if (notas.length == dado.length - 1) {
      notas.add(valor);
      for (int i = 0; i < notas.length - 1; i++) {
        MPC = (notas[i] / 10 * 3 * dado[i]["peso"]) / dado[i]["peso"];
      }
      nota_final = MPC + (notas[notas.length - 1] / 10 * 7);
      textfinal = "\n A nota final do aluno foi: $nota_final";
    } else {
      //Caso nada aconteça ela adiciona o valor informado pelo usuario para a lista de notas
      notas.add(valor);
    }
    //por algum motivo, o texto de qual tarefa atualiza caso isto esteja aqui, mesmo utilizando "tarefa = dado[cont]["tituloResumido"];" não atualizava o suficiente
    leitor();
  }

  //Inicializa o botão e puxa a primeira leitura
  @override
  void initState() {
    super.initState();
    leitor();
    txtBotao = "Submeter ir para a proxima tarefa";
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculo de notas",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("App para calculo de notas"),
        ),
        body: Column(children: [
          Text("Insira a nota do aluno para a tarefa: $tarefa",
              style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  fontFamily: "arial",
                  fontSize: 15)),
          const SizedBox(height: 20),
          Container(
            margin: EdgeInsets.only(left: 20.0, right: 20.0),
            width: 400,
            child: TextField(
              controller: notaAluno,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(5),
                labelText: 'Informe nota do aluno',
                border: OutlineInputBorder(),
              ),
              maxLines: 1,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
                TextInputFormatter.withFunction((oldValue, newValue) {
                  final text = newValue.text;
                  return text.isEmpty
                      ? newValue
                      : double.tryParse(text) == null
                          ? oldValue
                          : newValue;
                }),
              ],
            ),
          ),
          /*,*/
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: calcNota,
            child: Text(txtBotao),
          ),
          Text(textfinal,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
        ]),
      ),
    );
  }
}

class MeuApp extends StatefulWidget {
  const MeuApp({super.key});

  @override
  MeuAppState createState() {
    return MeuAppState();
  }
}*/

class Tarefa {
  final String tituloResumido;
  final double peso;

  Tarefa({required this.tituloResumido, required this.peso});

  factory Tarefa.fromJson(Map<String, dynamic> json) {
    return Tarefa(
      tituloResumido: json['tituloResumido'],
      peso: json['peso'],
    );
  }
}

class Medida {
  int? id;
  final String data;
  final double litros;
  String? temperatura;

  Medida(this.data, this.litros, this.temperatura);

  factory Medida.fromJson(Map<String, dynamic> json) {
    return Medida(
      DateTime.parse((json['data_medicao'] as String)).toLocal().toString(),
      double.parse(json['dado_medicao'] as String),
      json['temperatura_chip'] as String,
    );
  }

}
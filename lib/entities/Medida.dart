class Medida {
  int? id;
  final String data;
  final double litros;

  Medida(this.data, this.litros);

  factory Medida.fromJson(Map<String, dynamic> json) {
    return Medida(
      json['data'] as String,
      json['litros'] as double,
    );
  }
}
class Conferencia {
  final int id;
  final String codigo;

  Conferencia(
    this.id,
    this.codigo,
  );

  @override
  String toString() {
    return toMap().toString();
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'codigo': codigo,
    };
  }
}

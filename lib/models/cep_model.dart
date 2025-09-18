import 'dart:convert';

class CepModel {
  String cep;
  String logradouro;
  String uf;
  String cidade;
  CepModel({
    required this.cep,
    required this.logradouro,
    required this.uf,
    required this.cidade,
  });

  Map<String, dynamic> toMap() {
    return {
      'cep': cep,
      'logradouro': logradouro,
      'uf': uf,
      'cidade': cidade,
    };
  }

  factory CepModel.fromMap(Map<String, dynamic> map) {
    return CepModel(
      cep: map['cep'] ?? '',
      logradouro: map['logradouro'] ?? '',
      uf: map['uf'] ?? '',
      cidade: map['cidade'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CepModel.fromJson(String source) => CepModel.fromMap(json.decode(source));
}

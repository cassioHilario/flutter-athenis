import 'package:athenis/db/database_helper.dart';

class Empresa {

  late int cnpj;
  late String nome;
  late String email;
  late String vaga;
  late String desc_vaga;

  Empresa({
    required this.cnpj,
    required this.nome,
    required this.email,
    required this.vaga,
    required this.desc_vaga
});

  Map<String, dynamic> toMap(){
    var map = <String, dynamic>{
      DatabaseHelper.COLUNA_CNPJ: cnpj,
      DatabaseHelper.COLUNA_NOME: nome,
      DatabaseHelper.COLUNA_EMAIL: email,
      DatabaseHelper.COLUNA_VAGA: vaga,
      DatabaseHelper.COLUNA_DESC_VAGA: desc_vaga
    };

    return map;
  }

  Empresa.fromMap(Map<String, dynamic> map){
    cnpj = map[DatabaseHelper.COLUNA_CNPJ];
    nome = map[DatabaseHelper.COLUNA_NOME];
    email = map[DatabaseHelper.COLUNA_EMAIL];
    vaga = map[DatabaseHelper.COLUNA_VAGA];
    desc_vaga = map[DatabaseHelper.COLUNA_DESC_VAGA];
  }

}
import 'dart:io';

import 'package:athenis/db/database_helper.dart';

class Candidatos {
  late int cpf;
  late String nome;
  late String email;
  late DateTime data_nasc;
  late String habilidades;
  late String formacao;
  late String xp;
  late String ref;
  late String idiomas;
  late String telefone;


  Candidatos({
    required this.cpf,
    required this.nome,
    required this.email,
    // ignore: non_constant_identifier_names
    required this.data_nasc,
    required this.habilidades,
    required this.formacao,
    required this.xp,
    required this.ref,
    required this.idiomas,
    required this.telefone
  });

  Map<String, dynamic> toMap(){
    var map = <String, dynamic>{
      DatabaseHelper.COLUNA_CPF: cpf,
      DatabaseHelper.COLUNA_NOME: nome,
      DatabaseHelper.COLUNA_EMAIL: email,
      DatabaseHelper.COLUNA_DATA_NASC: data_nasc.toString(),
      DatabaseHelper.COLUNA_HABILIDADES: habilidades,
      DatabaseHelper.COLUNA_FORMACAO: formacao,
      DatabaseHelper.COLUNA_XP: xp,
      DatabaseHelper.COLUNA_REF: ref,
      DatabaseHelper.COLUNA_IDIOMAS: idiomas,
      DatabaseHelper.COLUNA_TELEFONE: telefone,
    };

    return map;
  }

  Candidatos.fromMap(Map<String, dynamic> map){
    cpf = map[DatabaseHelper.COLUNA_CPF];
    nome = map[DatabaseHelper.COLUNA_NOME];
    email = map[DatabaseHelper.COLUNA_EMAIL];
    data_nasc = DateTime.tryParse(map[DatabaseHelper.COLUNA_DATA_NASC])!;
    habilidades = map[DatabaseHelper.COLUNA_HABILIDADES];
    formacao = map[DatabaseHelper.COLUNA_FORMACAO];
    xp = map[DatabaseHelper.COLUNA_XP];
    ref = map[DatabaseHelper.COLUNA_REF];
    idiomas = map[DatabaseHelper.COLUNA_IDIOMAS];
    telefone = map[DatabaseHelper.COLUNA_TELEFONE];
  }

}
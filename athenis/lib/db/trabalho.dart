import 'package:athenis/models/empresa.dart';
import 'package:athenis/models/candidatos.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async{

  //region Varibles

  const String TABELA_CANDIDATO = "candidato";
  const String TABELA_EMPRESA = "empresa";

  const String COLUNA_CPF = "CPF";
  const String COLUNA_NOME = "NOME";
  const String COLUNA_EMAIL = "EMAIL";
  const String COLUNA_DATA_NASC = "DATA_NASC";
  const String COLUNA_HABILIDADES = "HABILIDADES";
  const String COLUNA_FORMACAO = "FORMACAO";
  const String COLUNA_XP = "EXPERIENCIA";
  const String COLUNA_REF = "REFERENCIAS";
  const String COLUNA_IDIOMAS = "IDIOMAS";
  const String COLUNA_TELEFONE = "TELEFONE";
  const String COLUNA_CNPJ = "CNPJ";
  const String COLUNA_VAGA = "VAGA";
  const String COLUNA_DESC_VAGA = "DESC_VAGA";

  //endregion

  WidgetsFlutterBinding.ensureInitialized();
  String dbPath = await getDatabasesPath();
  final database = openDatabase(
      join(dbPath, 'Trabalho.db'),
      version: 3,
      onCreate: (Database database, int version) async {
        await database.execute(
          "CREATE TABLE $TABELA_CANDIDATO ("
              "$COLUNA_CPF INTERGER PRIMARY KEY,"
              "$COLUNA_NOME TEXT,"
              "$COLUNA_EMAIL TEXT,"
              "$COLUNA_DATA_NASC TEXT,"
              "$COLUNA_HABILIDADES TEXT,"
              "$COLUNA_FORMACAO TEXT,"
              "$COLUNA_XP TEXT,"
              "$COLUNA_REF TEXT,"
              "$COLUNA_IDIOMAS TEXT,"
              "$COLUNA_TELEFONE TEXT"
              ");"
              "CREATE TABLE $TABELA_CANDIDATO ("
              "$COLUNA_CNPJ INTERGER PRIMARY KEY,"
              "$COLUNA_NOME TEXT,"
              "$COLUNA_EMAIL TEXT,"
              "$COLUNA_VAGA TEXT,"
              "$COLUNA_DESC_VAGA TEXT"
              ");",
        );
      }
  );

  //region Getters

  Future<List<Empresa>> getEmpresas() async{
    final db = await database;

    var empresas = await db.query(
        TABELA_EMPRESA,
        columns: [
          COLUNA_CNPJ,
          COLUNA_NOME,
          COLUNA_EMAIL,
          COLUNA_VAGA,
          COLUNA_DESC_VAGA,
        ]
    );

    List<Empresa> lstempresas = <Empresa>[];

    empresas.forEach((element) {
      Empresa empresa = Empresa.fromMap(element);
      lstempresas.add(empresa);
    });
    print(lstempresas);
    return lstempresas;
  }

  Future<List<Candidatos>> getCandidatos() async {
    final db = await database;

    var candidatos = await db.query(
        TABELA_CANDIDATO,
        columns: [
          COLUNA_CPF,
          COLUNA_NOME,
          COLUNA_EMAIL,
          COLUNA_DATA_NASC,
          COLUNA_HABILIDADES,
          COLUNA_FORMACAO,
          COLUNA_XP,
          COLUNA_REF,
          COLUNA_IDIOMAS,
          COLUNA_TELEFONE,
        ]
    );

    List<Candidatos> lstCandidatos = <Candidatos>[];

    candidatos.forEach((element) {
      Candidatos candidato = Candidatos.fromMap(element);
      lstCandidatos.add(candidato);
    });

    return lstCandidatos;
  }

  //endregion

  //region Inserts

  Future<Empresa> insertEmpresa (Empresa empresa) async {
    final db = await database;
    empresa.cnpj = await db.insert(TABELA_EMPRESA, empresa.toMap());
    return empresa;
  }

  Future<Candidatos> insertCandidato (Candidatos candidatos) async {
    final db = await database;
    candidatos.cpf = await db.insert(TABELA_CANDIDATO, candidatos.toMap());
    return candidatos;
  }

  //endregion

}
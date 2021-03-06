import 'package:athenis/models/candidatos.dart';
import 'package:athenis/models/empresa.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  
  //region Varibles
  
  static const String TABELA_CANDIDATO = "candidato";
  static const String TABELA_EMPRESA = "empresa";

  static const String COLUNA_CPF = "CPF";
  static const String COLUNA_NOME = "NOME";
  static const String COLUNA_EMAIL = "EMAIL";
  static const String COLUNA_DATA_NASC = "DATA_NASC";
  static const String COLUNA_HABILIDADES = "HABILIDADES";
  static const String COLUNA_FORMACAO = "FORMACAO";
  static const String COLUNA_XP = "EXPERIENCIA";
  static const String COLUNA_REF = "REFERENCIAS";
  static const String COLUNA_IDIOMAS = "IDIOMAS";
  static const String COLUNA_TELEFONE = "TELEFONE";
  static const String COLUNA_CNPJ = "CNPJ";
  static const String COLUNA_VAGA = "VAGA";
  static const String COLUNA_DESC_VAGA = "DESC_VAGA";
  
  //endregion

  DatabaseHelper._();
  static final DatabaseHelper db = DatabaseHelper._();

  late Database _database;

  Future<Database> get database async {
    if(_database != null) return _database;
    _database = await createDatabase();
    return _database;
  }
  
  //region CreateDatabase

  Future<Database> createDatabase() async {
    String dbPath = await getDatabasesPath();
    return await openDatabase(
      join(dbPath, 'Trabalho.db'),
      version: 1,
      onCreate: (Database database, int version) async {
        await database.execute(
          "CREATE TABLE $TABELA_CANDIDATO ("
            "$COLUNA_CPF INTEGER PRIMARY KEY,"
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
        );
        await database.execute(
          "CREATE TABLE $TABELA_EMPRESA ("
              "$COLUNA_CNPJ INTEGER PRIMARY KEY,"
              "$COLUNA_NOME TEXT,"
              "$COLUNA_EMAIL TEXT,"
              "$COLUNA_VAGA TEXT,"
              "$COLUNA_DESC_VAGA TEXT"
          ");",
        );
        await database.execute(
          "INSERT INTO $TABELA_EMPRESA ($COLUNA_CNPJ, $COLUNA_NOME, $COLUNA_EMAIL, $COLUNA_VAGA, $COLUNA_DESC_VAGA)"
          "VALUES ("
              "87553904000122,'F??cil Inform??tica','rh@facilinformatica.com.br','Analista de Qualidade de Software','Sobre seu papel no time:Identificar poss??veis falhas no sistema (seja de usabilidade, BUG, conceitual ou documenta????o) e oportunidades de melhoria;Ajudar a desenvolver, aprimorar e utilizar t??cnicas e estrat??gias de garantia de qualidade no processo de desenvolvimento;Implementar scripts para testes automatizados, garantindo efetividade e cobertura;Interagir com equipes de desenvolvimento para ajudar a implementar os testes automatizados de forma otimizada e reutiliz??vel;Manter os testes funcionais na pipeline de integra????o cont??nua;Pesquisar, identificar e implementar novas tecnologias de testes automatizados; Requirements and skills O que esperamos de voc??:Possua s??lido conhecimento (3 anos +) em planejamento de testes, ferramenta de gest??o de defeitos, controle de vers??o, tipos de testes e m??tricas de qualidade;Tenha experi??ncia com automa????o de testes;Tenha cursado Ci??ncia da Computa????o Sistemas de Informa????o, engenharia de Software ou cursos relacionados;Goste de aprender, defenda a qualidade de software e tenha conhecimento em padr??es e testes automatizados;Saiba como trabalhar em um ambiente ??gil, apoiado em m??tricas e focado em resultados e qualidade;Esteja constantemente aprendendo e se adaptando ao mercado, pois nossa arquitetura est?? sempre se renovando.Ser?? um diferencial:Experi??ncia em testes n??o funcionais(Jmeter ou Gatling);Experi??ncia em BDD, Gherkin, Cucumber e similares;Conhecimento e experi??ncia em .NET Core Framework, JavaScript, Azure;Experi??ncia em testes unit??rios;Automa????o de Testes de Interface usando BDD (C# JS/TS com Cypress). Additional information Vantagens e benef??cios:Vale-refei????o/alimenta????o Alelo - inclusive nas f??rias e sem nenhum tipo de desconto;Hor??rio flex??vel e banco de horas;Ajuda de Custo para reembolso de despesas referentes ao trabalho em home office;Plano de Sa??de com cobertura nacional e acomoda????o em apartamento;Plano Odontol??gico;Seguro de Vida;Somos uma empresa Empresa Cidad??, o que traz para m??es e pais a prorroga????o de Licen??a Maternidade e Paternidade;Acreditamos muito na cultura do Feedback e trabalhamos isso no nosso dia a dia;Apoio em capacita????es com foco no seu desenvolvimento (cursos, treinamentos e eventos);Vale-cultura, aceito em livrarias, loja de instrumento musical e etc;Take Blip Idiomas, temos bolsas para estudo dos idiomas Ingl??s ou Espanhol;Day-Off, um dia de folga oferecido em benef??cio ao dia do anivers??rio para que possa estar junto das pessoas que ama;Se a empresa tem lucro, voc?? tamb??m fez parte disso! Por isso, recebe PL e PLR, que s??o oferecidos de acordo com os crit??rios de cada programa. ISSO ?? TAKE BLIP!'"
              ")"
        );
        await database.execute(
          "INSERT INTO $TABELA_CANDIDATO ($COLUNA_CPF, $COLUNA_NOME, $COLUNA_EMAIL, $COLUNA_DATA_NASC, $COLUNA_HABILIDADES, $COLUNA_FORMACAO, $COLUNA_XP, $COLUNA_REF, $COLUNA_IDIOMAS, $COLUNA_TELEFONE)"
              "VALUES ("
                "22255524015,'C??ssio Hil??rio','cacaafh2000@gmail.com','2000-09-26 00:00:00.000', 'JAVA, PHP, DJANGO, BD','Ensino M??dio Completo','2 anos em empresa de Desenvolvimento','IHM Engenharia','Ingl??s, Espanhol','(78) 97422-4300'"
              ")"
        );
        await database.execute(
          "INSERT INTO $TABELA_CANDIDATO ($COLUNA_CPF, $COLUNA_NOME, $COLUNA_EMAIL, $COLUNA_DATA_NASC, $COLUNA_HABILIDADES, $COLUNA_FORMACAO, $COLUNA_XP, $COLUNA_REF, $COLUNA_IDIOMAS, $COLUNA_TELEFONE)"
              "VALUES ("
              "86127358078,'Wenzel Kallebe','kallebe9999@gmail.com','1993-03-28 00:00:00.000', 'FrontEnd, BackEnd, Python','Ensino Superior Completo','2 anos na Microsoft, 1 ano e 5 meses na Apple','Microsoft','Alem??o, Ingl??s, Espanhol',''(49) 90469-8700'"
              ")"
        );
        await database.execute(
          "INSERT INTO $TABELA_CANDIDATO ($COLUNA_CPF, $COLUNA_NOME, $COLUNA_EMAIL, $COLUNA_DATA_NASC, $COLUNA_HABILIDADES, $COLUNA_FORMACAO, $COLUNA_XP, $COLUNA_REF, $COLUNA_IDIOMAS, $COLUNA_TELEFONE)"
              "VALUES ("
              "84337671005,'Lucas Sensato','Sensatez015@outlook.com','1986-05-31 00:00:00.000', 'WEB, MOBILE, REDES','Mestre em Redes de Computadores','3 anos na empresa Google, 1 ano na empresa Sympla','Google','Ingl??s, Franc??s, Arabe','(80) 97799-2719'"
              ")"
        );
        await database.execute(
          "INSERT INTO $TABELA_CANDIDATO ($COLUNA_CPF, $COLUNA_NOME, $COLUNA_EMAIL, $COLUNA_DATA_NASC, $COLUNA_HABILIDADES, $COLUNA_FORMACAO, $COLUNA_XP, $COLUNA_REF, $COLUNA_IDIOMAS, $COLUNA_TELEFONE)"
              "VALUES ("
              "28029572018,'J??lia Beatriz','julhinha2005@msn.com.br','1990-01-19 00:00:00.000', 'IA, ENGENHARIA DE SOFTWARE','Doutora em Engenharia de Software','2 anos na Magazine Luiza, 3 anos na Samsung','Samsung','Espanhol, Grego, Latim','(46) 93873-8917'"
              ")"
        );
        await database.execute(
          "INSERT INTO $TABELA_CANDIDATO ($COLUNA_CPF, $COLUNA_NOME, $COLUNA_EMAIL, $COLUNA_DATA_NASC, $COLUNA_HABILIDADES, $COLUNA_FORMACAO, $COLUNA_XP, $COLUNA_REF, $COLUNA_IDIOMAS, $COLUNA_TELEFONE)"
              "VALUES ("
              "97116189076,'Melissa Cordeiro','melzinha1999@hotmail.com','1978-11-16 00:00:00.000', 'Processamento de Dados, Webmatering','P??s Doutorado em DataProcess','2 anos na empresa Facebook, 1 ano na empresa Twitter','Facebook','Ingl??s, Espanhol, Fr??nces, Jap??nes','(86) 91727-6478'"
              ")"
        );

      }
    );
  }
  //endregion
  
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

  Future<Empresa> getEmpresaById(int cnpj) async{
    final db = await database;
    var result = await db.query(TABELA_EMPRESA, where: "$COLUNA_CNPJ = ?", whereArgs: [cnpj]);
    return Empresa.fromMap(result.first);
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

  Future<Candidatos> getCandidatoById(int cpf) async{
    final db = await database;
    var result = await db.query(TABELA_CANDIDATO, where: "$COLUNA_CPF = ", whereArgs: [cpf]);
    return Candidatos.fromMap(result.first);
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
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
              "87553904000122,'Fácil Informática','rh@facilinformatica.com.br','Analista de Qualidade de Software','Sobre seu papel no time:Identificar possíveis falhas no sistema (seja de usabilidade, BUG, conceitual ou documentação) e oportunidades de melhoria;Ajudar a desenvolver, aprimorar e utilizar técnicas e estratégias de garantia de qualidade no processo de desenvolvimento;Implementar scripts para testes automatizados, garantindo efetividade e cobertura;Interagir com equipes de desenvolvimento para ajudar a implementar os testes automatizados de forma otimizada e reutilizável;Manter os testes funcionais na pipeline de integração contínua;Pesquisar, identificar e implementar novas tecnologias de testes automatizados; Requirements and skills O que esperamos de você:Possua sólido conhecimento (3 anos +) em planejamento de testes, ferramenta de gestão de defeitos, controle de versão, tipos de testes e métricas de qualidade;Tenha experiência com automação de testes;Tenha cursado Ciência da Computação Sistemas de Informação, engenharia de Software ou cursos relacionados;Goste de aprender, defenda a qualidade de software e tenha conhecimento em padrões e testes automatizados;Saiba como trabalhar em um ambiente ágil, apoiado em métricas e focado em resultados e qualidade;Esteja constantemente aprendendo e se adaptando ao mercado, pois nossa arquitetura está sempre se renovando.Será um diferencial:Experiência em testes não funcionais(Jmeter ou Gatling);Experiência em BDD, Gherkin, Cucumber e similares;Conhecimento e experiência em .NET Core Framework, JavaScript, Azure;Experiência em testes unitários;Automação de Testes de Interface usando BDD (C# JS/TS com Cypress). Additional information Vantagens e benefícios:Vale-refeição/alimentação Alelo - inclusive nas férias e sem nenhum tipo de desconto;Horário flexível e banco de horas;Ajuda de Custo para reembolso de despesas referentes ao trabalho em home office;Plano de Saúde com cobertura nacional e acomodação em apartamento;Plano Odontológico;Seguro de Vida;Somos uma empresa Empresa Cidadã, o que traz para mães e pais a prorrogação de Licença Maternidade e Paternidade;Acreditamos muito na cultura do Feedback e trabalhamos isso no nosso dia a dia;Apoio em capacitações com foco no seu desenvolvimento (cursos, treinamentos e eventos);Vale-cultura, aceito em livrarias, loja de instrumento musical e etc;Take Blip Idiomas, temos bolsas para estudo dos idiomas Inglês ou Espanhol;Day-Off, um dia de folga oferecido em benefício ao dia do aniversário para que possa estar junto das pessoas que ama;Se a empresa tem lucro, você também fez parte disso! Por isso, recebe PL e PLR, que são oferecidos de acordo com os critérios de cada programa. ISSO É TAKE BLIP!'"
              ")"
        );
        await database.execute(
          "INSERT INTO $TABELA_CANDIDATO ($COLUNA_CPF, $COLUNA_NOME, $COLUNA_EMAIL, $COLUNA_DATA_NASC, $COLUNA_HABILIDADES, $COLUNA_FORMACAO, $COLUNA_XP, $COLUNA_REF, $COLUNA_IDIOMAS, $COLUNA_TELEFONE)"
              "VALUES ("
                "22255524015,'Cássio Hilário','cacaafh2000@gmail.com','2000-09-26 00:00:00.000', 'JAVA, PHP, DJANGO, BD','Ensino Médio Completo','2 anos em empresa de Desenvolvimento','IHM Engenharia','Inglês, Espanhol','(78) 97422-4300'"
              ")"
        );
        await database.execute(
          "INSERT INTO $TABELA_CANDIDATO ($COLUNA_CPF, $COLUNA_NOME, $COLUNA_EMAIL, $COLUNA_DATA_NASC, $COLUNA_HABILIDADES, $COLUNA_FORMACAO, $COLUNA_XP, $COLUNA_REF, $COLUNA_IDIOMAS, $COLUNA_TELEFONE)"
              "VALUES ("
              "86127358078,'Wenzel Kallebe','kallebe9999@gmail.com','1993-03-28 00:00:00.000', 'FrontEnd, BackEnd, Python','Ensino Superior Completo','2 anos na Microsoft, 1 ano e 5 meses na Apple','Microsoft','Alemão, Inglês, Espanhol',''(49) 90469-8700'"
              ")"
        );
        await database.execute(
          "INSERT INTO $TABELA_CANDIDATO ($COLUNA_CPF, $COLUNA_NOME, $COLUNA_EMAIL, $COLUNA_DATA_NASC, $COLUNA_HABILIDADES, $COLUNA_FORMACAO, $COLUNA_XP, $COLUNA_REF, $COLUNA_IDIOMAS, $COLUNA_TELEFONE)"
              "VALUES ("
              "84337671005,'Lucas Sensato','Sensatez015@outlook.com','1986-05-31 00:00:00.000', 'WEB, MOBILE, REDES','Mestre em Redes de Computadores','3 anos na empresa Google, 1 ano na empresa Sympla','Google','Inglês, Francês, Arabe','(80) 97799-2719'"
              ")"
        );
        await database.execute(
          "INSERT INTO $TABELA_CANDIDATO ($COLUNA_CPF, $COLUNA_NOME, $COLUNA_EMAIL, $COLUNA_DATA_NASC, $COLUNA_HABILIDADES, $COLUNA_FORMACAO, $COLUNA_XP, $COLUNA_REF, $COLUNA_IDIOMAS, $COLUNA_TELEFONE)"
              "VALUES ("
              "28029572018,'Júlia Beatriz','julhinha2005@msn.com.br','1990-01-19 00:00:00.000', 'IA, ENGENHARIA DE SOFTWARE','Doutora em Engenharia de Software','2 anos na Magazine Luiza, 3 anos na Samsung','Samsung','Espanhol, Grego, Latim','(46) 93873-8917'"
              ")"
        );
        await database.execute(
          "INSERT INTO $TABELA_CANDIDATO ($COLUNA_CPF, $COLUNA_NOME, $COLUNA_EMAIL, $COLUNA_DATA_NASC, $COLUNA_HABILIDADES, $COLUNA_FORMACAO, $COLUNA_XP, $COLUNA_REF, $COLUNA_IDIOMAS, $COLUNA_TELEFONE)"
              "VALUES ("
              "97116189076,'Melissa Cordeiro','melzinha1999@hotmail.com','1978-11-16 00:00:00.000', 'Processamento de Dados, Webmatering','Pós Doutorado em DataProcess','2 anos na empresa Facebook, 1 ano na empresa Twitter','Facebook','Inglês, Espanhol, Frânces, Japônes','(86) 91727-6478'"
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
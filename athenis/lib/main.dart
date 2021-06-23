import 'package:athenis/models/empresa.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'pages/fulano.dart';
import 'pages/ciclano.dart';
import 'pages/beltrano.dart';

void main () => runApp(MaterialApp(
  theme: new ThemeData(scaffoldBackgroundColor: const Color.fromARGB(255, 0, 15, 38)),
  initialRoute: '/',
  routes: {
    '/': (context) => Home(),
    '/fulano': (context) => Fulano(),
    '/ciclano': (context) => Ciclano(),
    '/beltrano': (context) => Beltrano(),
  },
));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(
          'Athenis',
          style: TextStyle(
            color: Colors.white
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 0, 15, 38),
      ),
      drawer: SafeArea(
        child: _menu(context),
      ),
      body: _body(context),
    );
  }

  Container _body(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          _content(context),
        ],
      ),
    );
  }

  Column _content(BuildContext context){
    return Column(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(16),
            color: Colors.transparent,
            child: ListView(
              children: [
                Container(
                  child: new Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(backgroundImage: NetworkImage('https://image.flaticon.com/icons/png/512/3135/3135715.png')),
                        title: Text(
                          'Cássio Hilário',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        subtitle: Text(
                            'Programador Júnior',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        onTap: () {
                          print('Página de Fulano de Tal');
                          Navigator.pushNamed(context, '/fulano');
                        },
                        ),
                      ListTile(
                        leading: CircleAvatar(backgroundImage: NetworkImage('https://image.flaticon.com/icons/png/512/3135/3135715.png')),
                        title: Text(
                          'Wenzel Kallebe',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        subtitle: Text(
                          'Programador Pleno',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        onTap: () {
                          print('Página de Beltrano da Silva');
                          Navigator.pushNamed(context, '/beltrano');
                        },
                      ),
                      ListTile(
                        leading: CircleAvatar(backgroundImage: NetworkImage('https://image.flaticon.com/icons/png/512/3135/3135715.png')),
                        title: Text(
                          'Lucas Sensato',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        subtitle: Text(
                          'Estagiário',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        onTap: () {
                          print('Página de Ciclano de Oliveira');
                          Navigator.pushNamed(context, '/ciclano');
                        },
                      ),
                      ],
                    ),
                  ),
                ],
              )
            ),
        ),
      ],
    );
  }

  Drawer _menu(BuildContext context){

    Empresa facil = new Empresa(cnpj: 0, nome: "Fácil Informática", email: "rh@facilinformatica.com.br", vaga: "Analista de Qualidade de Software", desc_vaga: "Sobre seu papel no time:Identificar possíveis falhas no sistema (seja de usabilidade, BUG, conceitual ou documentação) e oportunidades de melhoria;Ajudar a desenvolver, aprimorar e utilizar técnicas e estratégias de garantia de qualidade no processo de desenvolvimento;Implementar scripts para testes automatizados, garantindo efetividade e cobertura;Interagir com equipes de desenvolvimento para ajudar a implementar os testes automatizados de forma otimizada e reutilizável;Manter os testes funcionais na pipeline de integração contínua;Pesquisar, identificar e implementar novas tecnologias de testes automatizados;");

    print(facil);
    // List<Empresa> lstempresas = <Empresa>[];
    // DatabaseHelper.db.getEmpresas().then((value) => lstempresas = value);
    // print(lstempresas);
    //
    // int CnpjEmpresa;
    // String NomeEmpresa;
    // String EmailEmpresa;
    // String VagaEmpresa;
    // String DescVagaEmpresa;

    // if(lstempresas.isEmpty) {
    //   Empresa facil = new Empresa(cnpj: 87553904000122, nome: 'Fácil Informática', email: 'rh@facilinformatica.com.br', vaga: 'Analista de Qualidade de Software', desc_vaga: 'Sobre seu papel no time:Identificar possíveis falhas no sistema (seja de usabilidade, BUG, conceitual ou documentação) e oportunidades de melhoria;Ajudar a desenvolver, aprimorar e utilizar técnicas e estratégias de garantia de qualidade no processo de desenvolvimento;Implementar scripts para testes automatizados, garantindo efetividade e cobertura;Interagir com equipes de desenvolvimento para ajudar a implementar os testes automatizados de forma otimizada e reutilizável;Manter os testes funcionais na pipeline de integração contínua;');
    //   print(facil);
    //   DatabaseHelper.db.insertEmpresa(facil);
    // }

    // CnpjEmpresa = lstempresas[0].cnpj;
    // NomeEmpresa = lstempresas[0].nome;
    // EmailEmpresa = lstempresas[0].email;
    // VagaEmpresa = lstempresas[0].vaga;
    // DescVagaEmpresa = lstempresas[0].desc_vaga;

    return Drawer(
      child: Container(
        color: Color.fromARGB(255, 0, 15, 38),
        child: ListView(
          children: [
            Container(
              child: UserAccountsDrawerHeader(
                accountName: Text(facil.nome),
                accountEmail: Text(facil.email),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage('https://image.flaticon.com/icons/png/512/993/993928.png'),
                ),
                decoration: BoxDecoration(color: Color.fromARGB(255, 0, 15, 38)),
              ),
            ),
            Container(
              color: Color.fromARGB(255, 0, 15, 38),
              child: new ExpansionTile(
                title: Text(
                    facil.vaga,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                children: [
                  ListTile(
                    title: Text(facil.desc_vaga, style: TextStyle(fontSize:15.0,color: Colors.white),),
                  ),
                ],
                )
              ),
          ],
        )
      ),
    );
  }

}



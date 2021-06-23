import 'package:athenis/models/candidatos.dart';
import 'package:flutter/material.dart';

class Beltrano extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(child: _body(context)),
    );
  }

  Container _body(BuildContext context){

    Candidatos candidato = new Candidatos(cpf: 86127358078, nome: 'Wenzel Kallebe', email: 'kallebe9999@gmail.com', data_nasc: DateTime(1993,3,28), habilidades: 'FrontEnd, BackEnd, Python', formacao: 'Ensino Superior Completo', xp: '2 anos na Microsoft, 1 ano e 5 meses na Apple', ref: 'Microsoft', idiomas: 'Alemão, Inglês, Espanhol', telefone: '(49) 90469-8700');

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: (){ Navigator.pop(context);}, child: Image.network("https://image.flaticon.com/icons/png/512/1946/1946433.png", width: 50.0,),style: ElevatedButton.styleFrom(primary: Colors.transparent, onPrimary: Colors.transparent, onSurface: Colors.transparent, shadowColor: Colors.transparent),),
          _sizedBox(5.0),
          Text(candidato.nome,
            style: TextStyle(fontSize: 22.0,color: Colors.white),),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 3.0),
            clipBehavior: Clip.antiAlias,
            color: Color.fromARGB(255, 31, 100, 112),
            elevation: 5.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 8.0),
              child: Row(children: [
                Expanded(child: Column(
                  children: [
                    Text(
                      "Data de nascimento",
                      style: TextStyle(
                          color: Color.fromARGB(255, 122, 177, 189),
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      "${candidato.data_nasc.day}/${candidato.data_nasc.month}/${candidato.data_nasc.year}",
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                )
                ),
                Expanded(child: Column(
                  children: [
                    Text(
                      "Vaga",
                      style: TextStyle(
                          color: Color.fromARGB(255, 122, 177, 189),
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      "Analista de Qualidade de Software",
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                )
                )
              ],
              ),
            ),
          ),
          _habilidades(candidato),
          _formacao(candidato),
          _xp(candidato),
          _ref(candidato),
          _idiomas(candidato),
          ElevatedButton(onPressed: (){}, child: Text('Entrar em Contato'))
        ],
      ),
    );
  }

  SizedBox _sizedBox(double valor){
    return SizedBox(height: valor,);
  }

  ExpansionTile _habilidades(Candidatos candidato){
    return ExpansionTile(
      title: Text(
        'Habilidades',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
      children: [
        ListTile(
          title: Text(candidato.habilidades, style: TextStyle(fontSize:15.0,color: Colors.white),),
        ),
      ],
    );
  }
  ExpansionTile _formacao(Candidatos candidato){
    return ExpansionTile(
      title: Text(
        'Formação',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
      children: [
        ListTile(
          title: Text(candidato.formacao, style: TextStyle(fontSize:15.0,color: Colors.white),),
        ),
      ],
    );
  }
  ExpansionTile _xp(Candidatos candidato){
    return ExpansionTile(
      title: Text(
        'Experiência',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
      children: [
        ListTile(
          title: Text(candidato.xp, style: TextStyle(fontSize:15.0,color: Colors.white),),
        ),
      ],
    );
  }
  ExpansionTile _ref(Candidatos candidato){
    return ExpansionTile(
      title: Text(
        'Referências',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
      children: [
        ListTile(
          title: Text(candidato.ref, style: TextStyle(fontSize:15.0,color: Colors.white),),
        ),
      ],
    );
  }
  ExpansionTile _idiomas(Candidatos candidato){
    return ExpansionTile(
      title: Text(
        'Idiomas',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
      children: [
        ListTile(
          title: Text(candidato.idiomas, style: TextStyle(fontSize:15.0,color: Colors.white),),
        ),
      ],
    );
  }

}
import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> perguntas = [
      {
        'texto': 'Qual é a sua cor favorita?',
        'respostas': ['Preto', 'Vermelho', 'Verde', 'Branco'],
      },
      {
        'texto': 'Qual é o seu animal favorito?',
        'respostas': ['Coelho', 'Cobra', 'Elefante', 'Leão'],
      },
      {
        'texto': 'Qual é o seu instrutor favorito?',
        'respostas': ['Maria', 'João', 'Léo', 'Pedro'],
      }
    ];

    //criar lista de respostas
    List<String> respostas = perguntas[_perguntaSelecionada]['respostas'];

    respostas.map((t) => Resposta(t, _responder)).toList();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: Column(
          children: <Widget>[
            Questao(perguntas[_perguntaSelecionada]['texto']),
            //... <= significa que um elemento pode estar dentro de outro elemento.
            //resumindo, uma lista pode estar dentro de outra lista.
            ...respostas.map((t) => Resposta(t, _responder)).toList(),
            //Map serve para transformar uma lista em outra lista de outro tipo.
          ],
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  //transforma um componente stateless para statefull
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}

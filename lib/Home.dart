import 'package:flutter/material.dart';
import 'package:perguntas_respostas_flutter/questionario.dart';
import 'package:perguntas_respostas_flutter/resultado.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': "Qual é a sua cor favorita?",
      'resposta': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Vermel', 'pontuacao': 5},
        {'texto': 'Verde', 'pontuacao': 1},
        {'texto': 'Branco', 'pontuacao': 8},
      ]
    },
    {
      'texto': "Qual é o seu animal favorito?",
      'resposta': [
        {'texto': 'Coelho', 'pontuacao': 10},
        {'texto': 'Cobra', 'pontuacao': 0},
        {'texto': 'Cachorro', 'pontuacao': 6},
        {'texto': 'Gato', 'pontuacao': 9},
      ]
    },
    {
      'texto': "Qual é o seu instrutor favorito?",
      'resposta': [
        {'texto': 'Maria', 'pontuacao': 1},
        {'texto': 'João', 'pontuacao': 9},
        {'texto': 'Leo', 'pontuacao': 10},
        {'texto': 'Pedro', 'pontuacao': 3},
      ]
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuest() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Peguntas")),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder)
            : Resultado(
                quandoReiniciarQuest: _reiniciarQuest,
                pontuacao: _pontuacaoTotal,
                texto: "Parabens!!",
              ));
  }
}


// return Resposta(
//             resp['texto'].toString(),
//             () => quandoResponder(int.parse(resp['pontuacao'].toString())),
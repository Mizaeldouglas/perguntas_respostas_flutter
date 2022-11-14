import 'package:flutter/material.dart';
import 'package:perguntas_respostas_flutter/questao.dart';
import 'package:perguntas_respostas_flutter/resposta.dart';

class Questionario extends StatelessWidget {
  const Questionario({
    Key? key,
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.quandoResponder,
  }) : super(key: key);

  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) quandoResponder;

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada]['resposta']
            as List<Map<String, Object>>
        : [];
    return Column(
      children: [
        Questao(texto: perguntas[perguntaSelecionada]['texto'] as String),
        ...respostas
            .map((resp) => Resposta(
                texto: resp['texto'] as String,
                quandoSelecionado: () =>
                    quandoResponder(int.parse(resp['pontuacao'].toString()))))
            .toList()
      ],
    );
  }
}

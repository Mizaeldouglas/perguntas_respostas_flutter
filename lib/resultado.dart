import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  const Resultado(
      {Key? key,
      required this.texto,
      required this.pontuacao,
      required this.quandoReiniciarQuest})
      : super(key: key);

  final String texto;
  final int pontuacao;
  final void Function() quandoReiniciarQuest;

  String get fraseResultado {
    if (pontuacao < 8) {
      return 'Parabéns!';
    } else if (pontuacao < 12) {
      return 'Você é Bom!';
    } else if (pontuacao < 16) {
      return 'Impressionante!';
    } else {
      return 'Nivel Jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 28),
          ),
        ),
        TextButton(
          onPressed: quandoReiniciarQuest,
          child: Text(
            "Reiniciar",
            style: TextStyle(fontSize: 18),
          ),
        )
      ],
    );
  }
}

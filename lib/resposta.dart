import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  const Resposta(
      {Key? key, required this.texto, required this.quandoSelecionado})
      : super(key: key);

  final String texto;

  final void Function() quandoSelecionado;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.blue),
          onPressed: quandoSelecionado,
          child: Text(
            texto,
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}

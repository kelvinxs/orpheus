import 'package:flutter/material.dart';
import 'package:orpheus/ui/feature/historia/selecao_fase_historia_page.dart';
import 'package:orpheus/ui/feature/pratica/selecao_fase_pretica_page.dart';

class SobrePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Sobre esta aplicação',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                Text(
                  "Este aplicativo foi feito para a exemplificação do uso de jogos eletrônicos no ensino e prática da teoria musical. Esta aplicação não possui qualquer forma de monetização.\nForam usadas imagens obtidas da internet para o desenvolvimento que estão listadas logo abaixo.",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

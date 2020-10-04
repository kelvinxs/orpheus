import 'package:flutter/material.dart';
import 'package:orpheus/data/model/enum/tipo_jogo.dart';
import 'package:orpheus/ui/feature/jogo/jogo_widget.dart';

class JogoHistoriaPage extends StatefulWidget {
  int nivel;

  JogoHistoriaPage(this.nivel);

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<JogoHistoriaPage> {
  @override
  Widget build(BuildContext context) {
    return JogoWidget(
      widget.nivel,
      tipoJogo: TipoJogo.HISTORIA,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:orpheus/data/model/enum/tipo_jogo.dart';
import 'package:orpheus/data/model/enum/tipo_questao.dart';
import 'package:orpheus/data/model/nota.dart';
import 'package:orpheus/resources/app_assets.dart';

class NotaMusicaoJogoWidget extends StatefulWidget {
  num width;
  num height;
  Nota nota;
  TipoJogo tipoJogo;
  TipoQuestao tipoQuestao;

  NotaMusicaoJogoWidget(
    this.nota, {
    this.width = double.infinity,
    this.height = double.infinity,
    this.tipoJogo = TipoJogo.HISTORIA,
    this.tipoQuestao = TipoQuestao.PARTITURA_CIFRA,
  });

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<NotaMusicaoJogoWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      color: Colors.cyan,
      child: Center(
        child: _conteudo(),
      ),
    );
  }

  Widget _conteudo() {
    if (widget.tipoQuestao == TipoQuestao.PARTITURA_CIFRA) {
      return Image.asset(AppAssets.image(widget.nota.imagemRes));
    } else if (widget.tipoQuestao == TipoQuestao.NOME_CIFRA) {
      return Text(widget.nota.nome.toUpperCase());
    }
    return Text(widget.nota.cifra);
  }
}

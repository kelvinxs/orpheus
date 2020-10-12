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
      decoration: BoxDecoration(
          color: Colors.indigo.shade600.withOpacity(.50),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.indigo.shade600.withOpacity(0.75),
              spreadRadius: 3,
              blurRadius: 3,
              offset: Offset(0, 0),
            ),
          ]),
      child: Container(
        alignment: Alignment.center,
        child: _conteudo(),
      ),
    );
  }

  Widget _conteudo() {
    if (widget.tipoQuestao == TipoQuestao.PARTITURA_CIFRA) {
      return Image.asset(
        AppAssets.image(widget.nota.imagemRes),
        width: widget.width * .65,
        height: widget.height * .65,
      );
    } else if (widget.tipoQuestao == TipoQuestao.NOME_CIFRA) {
      return Text(
        widget.nota.nome.toUpperCase(),
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      );
    }
    return Text(
      widget.nota.cifra,
      style: TextStyle(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

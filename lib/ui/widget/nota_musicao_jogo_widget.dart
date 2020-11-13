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
  Nota notaSelecionada;

  NotaMusicaoJogoWidget(
    this.nota, {
    this.width = double.infinity,
    this.height = double.infinity,
    this.tipoJogo = TipoJogo.HISTORIA,
    this.tipoQuestao = TipoQuestao.PARTITURA_CIFRA,
    this.notaSelecionada,
  });

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<NotaMusicaoJogoWidget> {
  @override
  Widget build(BuildContext context) {
    var cor = Colors.lightBlue.shade400;
    if (widget.notaSelecionada != null) {
      if (widget.notaSelecionada.id == widget.nota.id) {
        cor = Colors.teal.shade400;
      } else {
        cor = Colors.redAccent.shade200;
      }
    }
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: cor.withOpacity(.85),
        shape: BoxShape.circle,
        border: Border.all(
          color: Color(0xffffffff).withOpacity(.85),
          width: 5,
        ),
      ),
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
        width: widget.width * .75,
        height: widget.height * .65,
        color: Colors.white,
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

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:orpheus/data/model/enum/tipo_jogo.dart';
import 'package:orpheus/data/model/enum/tipo_questao.dart';
import 'package:orpheus/data/model/nota.dart';
import 'package:orpheus/data/model/questao.dart';
import 'package:orpheus/resources/app_assets.dart';
import 'package:orpheus/ui/widget/nota_musicao_jogo_widget.dart';

class JogoWidget extends StatefulWidget {
  int nivel;
  TipoJogo tipoJogo;

  JogoWidget(this.nivel, {this.tipoJogo = TipoJogo.HISTORIA});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<JogoWidget> {
  double _vida;
  double _vidaInimigo;
  Questao _questaoAtual;
  List<Nota> _ordemOpcoes;
  Nota _notaSelecionada;

  @override
  void initState() {
    super.initState();
    _vida = 100;
    _vidaInimigo = 100;

    var tipo = TipoQuestao.NOME_CIFRA;

    switch (widget.nivel) {
      case 0:
        {
          var rng = Random().nextInt(2) % 2;
          tipo = rng == 0 ? TipoQuestao.NOME_CIFRA : TipoQuestao.CIFRA_NOME;
          break;
        }
      default:
        {
          var rng = Random().nextInt(2) % 2;
          tipo = rng == 0
              ? TipoQuestao.CIFRA_PARTITURA
              : TipoQuestao.PARTITURA_CIFRA;
          break;
        }
    }

    _questaoAtual = Questao(
      tipo: tipo,
      nivel: 0,
      notaPrincipal: Nota(
        nome: "Dó",
        nivel: widget.nivel,
        cifra: "C",
        imagemRes: "nota_do_escala_sol.png",
        posicaoEscalaSol: -2,
      ),
      opcao1: Nota(
        nome: "Ré",
        nivel: widget.nivel,
        cifra: "D",
        imagemRes: "nota_re_escala_sol.png",
        posicaoEscalaSol: -1,
      ),
      opcao2: Nota(
        nome: "Sol",
        nivel: widget.nivel,
        cifra: "G",
        imagemRes: "nota_sol_escala_sol.png",
        posicaoEscalaSol: 2,
      ),
      opcao3: Nota(
        nome: "Si",
        nivel: widget.nivel,
        cifra: "B",
        imagemRes: "nota_si_escala_sol.png",
        posicaoEscalaSol: 4,
      ),
    );

    _ordemOpcoes = List();
    _ordemOpcoes.addAll([
      _questaoAtual.opcao1,
      _questaoAtual.opcao2,
      _questaoAtual.opcao3,
      _questaoAtual.notaPrincipal
    ]);
    _ordemOpcoes.shuffle(Random());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade300,
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              _batalha(),
              _acoes(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _batalha() {
    var screenSize = MediaQuery.of(context).size;
    var widthBarraVida = (screenSize.width / 2) - 39;
    var barraVidaJogador = widthBarraVida / 100;
    barraVidaJogador *= _vida;
    var barraVidaInimigo = widthBarraVida / 100;
    barraVidaInimigo *= _vidaInimigo;

    print(barraVidaJogador);

    return Container(
      width: double.infinity,
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 5, left: 10, right: 10),
              child: Column(
                children: [
                  Container(
                    height: 20,
                    width: widthBarraVida,
                    color: Colors.grey,
                    margin: EdgeInsets.only(bottom: 5),
                    padding: EdgeInsets.all(2),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: barraVidaJogador - 24,
                      ),
                      child: Container(
                        color: Colors.green,
                      ),
                    ),
                  ),
                  Image.asset(AppAssets.image("jogador.png")),
                ],
              ),
            ),
            Expanded(child: Container()),
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 5, left: 10, right: 10),
              child: Column(
                children: [
                  Container(
                    height: 20,
                    color: Colors.grey,
                    width: widthBarraVida,
                    margin: EdgeInsets.only(bottom: 5),
                    padding: EdgeInsets.all(2),
                    child: SizedBox(
                      width: barraVidaInimigo - 24,
                      child: Container(
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Image.asset(AppAssets.image("inimigo.png")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _acoes() {
    var screenSize = MediaQuery.of(context).size;

    var maxSize = 200.0;
    var menorTamanho = screenSize.width;
    if (menorTamanho > screenSize.height) {
      menorTamanho = screenSize.height;
    }
    if(menorTamanho > maxSize){
      menorTamanho = maxSize;
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        NotaMusicaoJogoWidget(
          _questaoAtual.notaPrincipal,
          width: menorTamanho,
          height: menorTamanho,
          tipoQuestao: _questaoAtual.tipo,
          tipoJogo: widget.tipoJogo,
        ),
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              _opcao(_ordemOpcoes[0]),
              _opcao(_ordemOpcoes[1]),
            ],
          ),
        ),
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              _opcao(_ordemOpcoes[2]),
              _opcao(_ordemOpcoes[3]),
            ],
          ),
        ),
      ],
    );
  }

  Widget _opcao(Nota nota) {
    Widget conteudo;
    if (_questaoAtual.tipo == TipoQuestao.CIFRA_NOME) {
      conteudo = Text(nota.nome);
    } else if (_questaoAtual.tipo == TipoQuestao.CIFRA_PARTITURA) {
      conteudo = Image.asset(AppAssets.image(nota.imagemRes));
    } else {
      conteudo = Text(nota.cifra);
    }

    var width = 150.0;
    var screenSize = MediaQuery.of(context).size;

    var itemPadding = 10.0;
    var maxWidth = (screenSize.width/2)-(itemPadding*2);

    if(width > maxWidth){
      width = maxWidth;
    }

    print("$width - $maxWidth");

    var color = Colors.amberAccent.shade200;

    if(_notaSelecionada != null && _notaSelecionada.nome == nota.nome){
      if(_notaSelecionada.nome == _questaoAtual.notaPrincipal.nome){
        color = Colors.greenAccent.shade200;
      }else{
        color = Colors.redAccent.shade200;
      }
    }

    return GestureDetector(
      onTap: () {
        if(_notaSelecionada != null) return;
        var acertou = _questaoAtual.notaPrincipal.nome == nota.nome;
        setState(() {
          _notaSelecionada = nota;
          if(acertou){
            _vidaInimigo -= 20;
          }else{
            _vida -= 20;
          }
        });
        Future.delayed(Duration(milliseconds: 750)).then((value) {
          setState(() {
            _notaSelecionada = null;
          });
        });
      },
      child: Container(
        width: width,
        margin: EdgeInsets.all(itemPadding),
        color: color,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Center(child: conteudo,),
      ),
    );
  }
}

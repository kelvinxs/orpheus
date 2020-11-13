import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orpheus/data/model/enum/tipo_jogo.dart';
import 'package:orpheus/data/model/enum/tipo_questao.dart';
import 'package:orpheus/data/model/nota.dart';
import 'package:orpheus/data/model/questao.dart';
import 'package:orpheus/resources/app_assets.dart';
import 'package:orpheus/ui/feature/jogo/bloc/jogo_bloc.dart';
import 'package:orpheus/ui/widget/nota_musicao_jogo_widget.dart';
import 'package:orpheus/utils/size_util.dart';

class JogoPage extends StatefulWidget {
  int nivel;
  TipoJogo tipoJogo;
  JogoBloc jogoBloc;

  JogoPage(this.nivel, this.tipoJogo) {
    jogoBloc = JogoBloc();
  }

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<JogoPage> {
  double _vida;
  double _vidaInimigo;
  Nota _notaSelecionada;

  @override
  void initState() {
    super.initState();
    _vida = 100;
    _vidaInimigo = 100;

    widget.jogoBloc.iniciarFase(widget.tipoJogo, widget.nivel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade300,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff203409),
                Color(0xff111b04),
              ],
            ),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (_vida <= 0) {
                return _gameOver();
              } else {
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    _batalha(),
                    Expanded(child: _acoes()),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          margin: EdgeInsets.all(10.width),
                          padding: EdgeInsets.all(10.width),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(.85),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Icon(
                            Icons.exit_to_app_rounded,
                            color: Colors.white,
                            size: 30.width,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _batalha() {
    var screenSize = MediaQuery.of(context).size;
    var widthBarraVida = (screenSize.width / 2) - 60;
    if (widthBarraVida > 400) {
      widthBarraVida = 400;
    }
    var barraVidaJogador = widthBarraVida / 100;
    if (_vida > 0) {
      barraVidaJogador *= _vida;
    } else if (barraVidaJogador < 25) {
      barraVidaJogador = 0;
    }
    var barraVidaInimigo = widthBarraVida / 100;
    if (_vidaInimigo > 0) {
      barraVidaInimigo *= _vidaInimigo;
    } else if (barraVidaInimigo < 25) {
      barraVidaInimigo = 0;
    }

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.image("background.png")),
          alignment: Alignment.bottomCenter,
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
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
                    height: 30,
                    width: widthBarraVida,
                    margin: EdgeInsets.only(bottom: 15),
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.75),
                          spreadRadius: 0,
                          blurRadius: 3,
                          offset: Offset(3, 3),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: barraVidaJogador,
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              color: Colors.yellow.shade800,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            "$_vida%",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    AppAssets.image("jogador.png"),
                    width: 50,
                    height: 50,
                    alignment: Alignment.bottomCenter,
                  ),
                ],
              ),
            ),
            Expanded(child: Container()),
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 5, left: 10, right: 10),
              child: Column(
                children: [
                  Container(
                    height: 30,
                    width: widthBarraVida,
                    margin: EdgeInsets.only(bottom: 15),
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.75),
                          spreadRadius: 0,
                          blurRadius: 3,
                          offset: Offset(3, 3),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: barraVidaInimigo,
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            "$_vidaInimigo%",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    AppAssets.image("inimigo.png"),
                    width: 50,
                    height: 50,
                    alignment: Alignment.bottomCenter,
                  ),
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
    if (menorTamanho > maxSize) {
      menorTamanho = maxSize;
    }

    return StreamBuilder(
        stream: widget.jogoBloc.questaoObservable,
        initialData: null,
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          var questao = snapshot.data as Questao;

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              NotaMusicaoJogoWidget(
                questao.notaPrincipal,
                width: menorTamanho,
                height: menorTamanho,
                tipoQuestao: questao.tipo,
                tipoJogo: widget.tipoJogo,
                notaSelecionada: _notaSelecionada,
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    _opcao(questao, questao.opcoes[0]),
                    _opcao(questao, questao.opcoes[1]),
                  ],
                ),
              ),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    _opcao(questao, questao.opcoes[2]),
                    _opcao(questao, questao.opcoes[3]),
                  ],
                ),
              ),
            ],
          );
        });
  }

  Widget _opcao(Questao questao, Nota nota) {
    Widget conteudo;
    if (questao.tipo == TipoQuestao.CIFRA_NOME) {
      conteudo = Text(
        nota.nome,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 16,
        ),
      );
    } else {
      conteudo = Text(
        nota.cifra,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 16,
        ),
      );
    }

    var width = 150.0;
    var screenSize = MediaQuery.of(context).size;

    var itemPadding = 10.0;
    var maxWidth = (screenSize.width / 2) - (itemPadding * 2);

    if (width > maxWidth) {
      width = maxWidth;
    }

    var color = Colors.lightBlue.shade400;

    if (_notaSelecionada != null && _notaSelecionada.id == nota.id) {
      if (_notaSelecionada.id == questao.notaPrincipal.id) {
        color = Colors.teal.shade400;
      } else {
        color = Colors.redAccent.shade200;
      }
    }

    return GestureDetector(
      onTap: () {
        if (_notaSelecionada != null) return;
        var acertou = questao.notaPrincipal.id == nota.id;
        setState(() {
          _notaSelecionada = nota;
          if (acertou) {
            _vidaInimigo -= 20;
          } else {
            _vida -= 20;
          }
        });
        Future.delayed(Duration(milliseconds: 750)).then((value) {
          setState(() {
            if (_vidaInimigo <= 0) {
              _vidaInimigo = 100;
            }
            widget.jogoBloc.registrarResposta(questao, _notaSelecionada);
            _notaSelecionada = null;
          });
        });
      },
      child: Container(
        width: width,
        margin: EdgeInsets.all(itemPadding),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Center(
          child: conteudo,
        ),
        decoration: BoxDecoration(
          color: color.withOpacity(.85),
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(
            color: Colors.white.withOpacity(.85),
            width: 2,
          ),
        ),
      ),
    );
  }

  Widget _gameOver() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Game Over",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: FlatButton(
              onPressed: () {
                setState(() {
                  _vida = 100;
                  _vidaInimigo = 100;
                  widget.jogoBloc.iniciarFase(widget.tipoJogo, widget.nivel);
                });
              },
              child: Text("Tentar Novamente"),
              color: Colors.indigo,
              padding: EdgeInsets.all(15.width),
              textColor: Colors.white,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Voltar"),
              color: Colors.deepOrange,
              padding: EdgeInsets.all(15.width),
              textColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orpheus/data/model/enum/tipo_jogo.dart';
import 'package:orpheus/data/model/enum/tipo_questao.dart';
import 'package:orpheus/data/model/nota.dart';
import 'package:orpheus/data/model/questao.dart';
import 'package:orpheus/resources/app_assets.dart';
import 'package:orpheus/ui/feature/historia/historia_page.dart';
import 'package:orpheus/ui/feature/jogo/bloc/jogo_bloc.dart';
import 'package:orpheus/ui/widget/nota_musicao_jogo_widget.dart';
import 'package:orpheus/utils/size_util.dart';

class JogoHistoriaPage extends StatefulWidget {
  int nivel;
  TipoJogo tipoJogo;
  JogoBloc jogoBloc;

  JogoHistoriaPage(this.nivel) {
    this.tipoJogo = TipoJogo.HISTORIA;
    jogoBloc = JogoBloc();
  }

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<JogoHistoriaPage> {
  Nota _notaSelecionada;
  bool _acertou;

  @override
  void initState() {
    super.initState();
    widget.jogoBloc.iniciarFase(widget.tipoJogo, widget.nivel);
    widget.jogoBloc.fimJogoObservable.listen((event) {
      if (event == true) {
        var nav = Navigator.of(context);
        nav.pop();
        if(widget.nivel < 2){
          nav.push(MaterialPageRoute(
              builder: (context) => HistoriaPage(widget.nivel + 1)));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade300,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.image("background_historia.png")),
              alignment: Alignment.center,
              fit: BoxFit.cover,
            ),
          ),
          child: StreamBuilder(
            stream: widget.jogoBloc.questaoObservable,
            initialData: null,
            builder: (context, snapshot) {
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  _batalha(snapshot.data),
                  Expanded(child: _acoes(snapshot)),
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
                          color: Colors.black.withOpacity(.35),
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
            },
          ),
        ),
      ),
    );
  }

  Widget _batalha(Questao questao) {
    if (questao == null) return Container();
    Color corCaixa = Colors.lightBlue.shade400;
    var qntAcertos = questao.numAcertoNota;

    if (_notaSelecionada != null) {
      if (_acertou) {
        corCaixa = Colors.teal.shade400;
        qntAcertos++;
      } else {
        corCaixa = Colors.redAccent.shade200;
        qntAcertos--;
        if (qntAcertos < 0) {
          qntAcertos = 0;
        }
      }
    }

    return Container(
      margin:
          EdgeInsets.symmetric(horizontal: 10.width).copyWith(top: 20.height),
      padding: EdgeInsets.symmetric(horizontal: 10.width, vertical: 15.height),
      decoration: BoxDecoration(
        color: corCaixa.withOpacity(.95),
        borderRadius: BorderRadius.all(Radius.circular(20)),
        border: Border.all(width: 2.0, color: Colors.white),
      ),
      child: Column(
        children: [
          Text(
            "Progresso desta nota",
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.sp,
            ),
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 5.height)),
          Text(
            "$qntAcertos / ${questao.numTentativasNota}",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _acoes(AsyncSnapshot<Questao> snapshot) {
    var screenSize = MediaQuery.of(context).size;

    var maxSize = 200.0;
    var menorTamanho = screenSize.width;
    if (menorTamanho > screenSize.height) {
      menorTamanho = screenSize.height;
    }
    if (menorTamanho > maxSize) {
      menorTamanho = maxSize;
    }

    if (snapshot.data == null) {
      return Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    var questao = snapshot.data;

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

    if (_notaSelecionada != null) {
      if (_notaSelecionada.id == nota.id) {
        if (_acertou) {
          color = Colors.teal.shade400;
        } else {
          color = Colors.redAccent.shade200;
        }
      } else if (questao.notaPrincipal.id == nota.id) {
        if (nota.id == questao.notaPrincipal.id) {
          color = Colors.teal.shade400;
        } else {
          color = Colors.redAccent.shade200;
        }
      }
    }

    return GestureDetector(
      onTap: () {
        if (_notaSelecionada != null) return;
        setState(() {
          _notaSelecionada = nota;
          _acertou = questao.notaPrincipal.id == _notaSelecionada.id;
        });
        Future.delayed(Duration(milliseconds: 750)).then((value) {
          setState(() {
            widget.jogoBloc.registrarResposta(questao, _notaSelecionada);
            _notaSelecionada = null;
            _acertou = null;
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
                  widget.jogoBloc.iniciarFase(widget.tipoJogo, widget.nivel);
                });
              },
              child: Text("Tentar Novamente"),
              color: Colors.indigo,
              padding: EdgeInsets.all(10),
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
              padding: EdgeInsets.all(10),
              textColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

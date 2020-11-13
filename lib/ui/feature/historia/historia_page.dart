
import 'package:flutter/material.dart';
import 'package:orpheus/controller/dados/falas.dart';
import 'package:orpheus/data/model/enum/tipo_jogo.dart';
import 'package:orpheus/data/model/fala_historia.dart';
import 'package:orpheus/data/model/historia.dart';
import 'package:orpheus/resources/app_assets.dart';
import 'package:orpheus/ui/feature/jogo/jogo_historia_page.dart';
import 'package:orpheus/ui/feature/jogo/jogo_page.dart';
import 'package:orpheus/utils/size_util.dart';

class HistoriaPage extends StatefulWidget {
  int nivel;

  HistoriaPage(this.nivel) : assert(nivel >= 0);

  @override
  State<StatefulWidget> createState() => _HistoriaPageState();
}

class _HistoriaPageState extends State<HistoriaPage> {
  int _pos = 0;
  Historia _historia;

  @override
  void initState() {
    super.initState();
    _historia = Falas.lista
        .firstWhere((element) => element.faseHistoria == widget.nivel);
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = 250.0;
    var height = 286.0;
    var maxWidth = screenSize.width * .7;
    var maxHeight = screenSize.height * .7;

    if (width > maxWidth) {
      width = maxWidth;
    }
    if (height > maxHeight) {
      height = maxHeight;
    }

    var fala = _historia.falas.firstWhere((element) => element.posicao == _pos);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: GestureDetector(
          onTap: () async {
            var proximo = _pos + 1;
            var fala = _historia.falas.firstWhere(
              (element) => element.posicao == proximo,
              orElse: () => null,
            );
            if (fala != null) {
              setState(() {
                _pos = proximo;
              });
            } else {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      JogoHistoriaPage(widget.nivel),
                ),
              );
            }
          },
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.image("background_historia.png")),
                alignment: Alignment.center,
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      margin: EdgeInsets.all(10.width),
                      padding: EdgeInsets.all(5.width),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                        size: 30.width,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: screenSize.height * .85,
                    child: Image.asset(
                      AppAssets.image("bard_teacher.png"),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: _dialogo(fala),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _dialogo(FalaHistoria fala) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: _image(fala),
        ),
        _caixaTexto(fala),
      ],
    );
  }

  Widget _caixaTexto(FalaHistoria fala) {
    var width = MediaQuery.of(context).size.width;

    var textWidth = width - 30.width;

    return Container(
      width: textWidth,
      height: 160.height,
      margin:
          EdgeInsets.symmetric(horizontal: 15.width).copyWith(bottom: 15.width),
      padding: EdgeInsets.all(15.width),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.lightBlue.shade100.withOpacity(.75),
        borderRadius: BorderRadius.circular(5),
        border:
            Border.all(color: Colors.white, width: 2, style: BorderStyle.solid),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              fala.texto,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            width: 30.width,
            alignment: Alignment.bottomCenter,
            child: Icon(
              Icons.navigate_next,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _image(FalaHistoria fala) {
    if (fala.imagem == null || fala.imagem.isEmpty) {
      return Container();
    }
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.lightBlue.shade100.withOpacity(.75),
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.white, width: 2),
      ),
      margin:
          EdgeInsets.symmetric(horizontal: 20.width).copyWith(bottom: 5.height),
    );
  }
}

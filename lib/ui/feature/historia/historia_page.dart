import 'dart:math';

import 'package:flutter/material.dart';
import 'package:orpheus/resources/app_assets.dart';

class HistoriaPage extends StatefulWidget {
  int nivel;

  HistoriaPage(this.nivel):assert(nivel >= 0);

  @override
  State<StatefulWidget> createState() => _HistoriaPageState();
}

class _HistoriaPageState extends State<HistoriaPage> {
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

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: GestureDetector(
          onTap: (){
            setState(() {

            });
          },
          child:Column(
            children: [
              Expanded(
                flex: 3,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: screenSize.width,
                        height: screenSize.height,
                        child: Image.asset(
                          AppAssets.image("casa_ionia.png"),
                          fit: BoxFit.cover,
                          alignment: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: SizedBox(
                              width: width,
                              height: height,
                              child: Image.asset(
                                AppAssets.image("bard3.png"),
                              ),
                            ),
                          ),
                          _image(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: _textBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textBox() {
    return Container(
      color: Colors.green,
      width: double.infinity,
      padding: EdgeInsets.all(10),
      child: Text(
        "Testeeteada asidoaso an naoe oiae oa ioae ou ioae noa nioa nioa Testeeteada asidoaso an naoe oiae oa ioae ou ioae noa nioa nioa Testeeteada asidoaso an naoe oiae oa ioae ou ioae noa nioa nioa",
        style: TextStyle(
          color: Colors.white,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }

  Widget _image() {
    var rnd = Random().nextInt(2);
    if (rnd == 0) {
      return Container();
    }
    return Container(
      width: 200,
      height: 200,
      color: Colors.yellow,
      margin: EdgeInsets.all(20),
    );
  }
}

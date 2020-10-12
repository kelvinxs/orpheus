import 'dart:math';

import 'package:flutter/material.dart';
import 'package:orpheus/data/model/enum/tipo_jogo.dart';
import 'package:orpheus/ui/feature/jogo/jogo_page.dart';

class SelecaoFasePraticaPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SelecaoFasePraticaPageState();
}

class _SelecaoFasePraticaPageState extends State<SelecaoFasePraticaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _botaoPratica(0),
            _botaoPratica(1),
            _botaoPratica(2),
          ],
        ),
      ),
    );
  }

  Widget _botaoPratica(int nivel) {
    return FlatButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => JogoPage(nivel, TipoJogo.SEM_FIM)));
        },
        child: Text("Nível ${nivel + 1}"));
  }
}

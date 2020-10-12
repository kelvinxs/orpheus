import 'dart:math';

import 'package:flutter/material.dart';
import 'package:orpheus/resources/app_assets.dart';
import 'package:orpheus/ui/feature/historia/historia_page.dart';

class SelecaoFaseHistoriaPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SelecaoFaseHistoriaPageState();
}

class _SelecaoFaseHistoriaPageState extends State<SelecaoFaseHistoriaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _botaoAula(0),
            _botaoAula(1),
            _botaoAula(2),
          ],
        ),
      ),
    );
  }

  Widget _botaoAula(int nivel) {
    return FlatButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => HistoriaPage(nivel)));
        },
        child: Text("Aula ${nivel + 1}"));
  }
}

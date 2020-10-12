import 'package:flutter/material.dart';
import 'package:orpheus/ui/feature/historia/selecao_fase_historia_page.dart';
import 'package:orpheus/ui/feature/home/sobre_page.dart';
import 'package:orpheus/ui/feature/pratica/selecao_fase_pretica_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlatButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SelecaoFaseHistoriaPage()));
            },
            child: Text("História"),
          ),
          FlatButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SelecaoFasePraticaPage()));
              },
            child: Text("Praticar"),
          ),
          FlatButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SobrePage()));
              },
            child: Text("Sobre"),
          ),
        ],
      ),
    ));
  }
}

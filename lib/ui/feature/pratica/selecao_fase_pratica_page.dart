
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orpheus/data/model/enum/tipo_jogo.dart';
import 'package:orpheus/data/model/fase.dart';
import 'package:orpheus/resources/app_assets.dart';
import 'package:orpheus/ui/feature/jogo/jogo_page.dart';
import 'package:orpheus/ui/feature/pratica/bloc/selecao_fase_pratica_bloc.dart';
import 'package:orpheus/utils/size_util.dart';

class SelecaoFasePraticaPage extends StatefulWidget {
  SelecaoFasePraticaBloc bloc;

  SelecaoFasePraticaPage() {
    bloc = SelecaoFasePraticaBloc();
  }

  @override
  State<StatefulWidget> createState() => _SelecaoFasePraticaPageState();
}

class _SelecaoFasePraticaPageState extends State<SelecaoFasePraticaPage> {
  @override
  void initState() {
    super.initState();
    widget.bloc.buscarFases();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.image("background_historia.png")),
              alignment: Alignment.center,
              fit: BoxFit.cover,
            ),
          ),
          child: StreamBuilder(
            stream: widget.bloc.fasesObservable,
            initialData: null,
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              var fases = snapshot.data as List<Fase>;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: fases.map((e) => _botaoPratica(e)).toList()
                  ..insert(
                      0,
                      Align(
                        alignment: Alignment.centerLeft,
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
                      ))
                  ..insert(1, Expanded(child: Container()))
                  ..add(Expanded(child: Container())),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _botaoPratica(Fase fase) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.width, vertical: 5.height),
      child: FlatButton(
        onPressed: fase.habilitada
            ? () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            JogoPage(fase.nivelNotaMaxima, TipoJogo.SEM_FIM)));
              }
            : null,
        color: Colors.purple.shade300,
        splashColor: Colors.purple.shade500,
        disabledColor: Colors.blueGrey.shade100,
        textColor: Colors.white,
        disabledTextColor: Colors.black.withOpacity(.35),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(500.0)),
        padding:
            EdgeInsets.symmetric(horizontal: 35.width, vertical: 17.height),
        child: Text(
          fase.nome,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }
}

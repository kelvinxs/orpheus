import 'package:flutter/material.dart';
import 'package:orpheus/resources/app_assets.dart';
import 'package:orpheus/ui/feature/historia/selecao_fase_historia_page.dart';
import 'package:orpheus/ui/feature/home/sobre_page.dart';
import 'package:orpheus/ui/feature/pratica/selecao_fase_pratica_page.dart';
import 'package:orpheus/utils/size_util.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.image("background_historia.png")),
                alignment: Alignment.center,
                fit: BoxFit.cover,
              ),
            ),
            padding: EdgeInsets.all(10.width),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                      child: Container(
                        margin: EdgeInsets.all(10.width),
                        constraints: BoxConstraints(
                          maxHeight: 30.width,
                          maxWidth: 30.width,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "?",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SobrePage()));
                      }),
                ),
                Expanded(child: Container()),
                FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SelecaoFaseHistoriaPage()));
                  },
                  color: Colors.orange,
                  splashColor: Colors.orange.shade800,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(500.0)),
                  padding: EdgeInsets.symmetric(
                      horizontal: 35.width, vertical: 17.height),
                  child: Text(
                    "História",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 5.height)),
                FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SelecaoFasePraticaPage()));
                  },
                  color: Colors.purple.shade300,
                  splashColor: Colors.purple.shade500,
                  padding: EdgeInsets.symmetric(
                      horizontal: 35.width, vertical: 17.height),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(500.0)),
                  child: Text(
                    "Praticar",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(child: Container()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

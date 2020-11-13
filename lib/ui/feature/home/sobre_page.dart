import 'package:flutter/material.dart';
import 'package:orpheus/resources/app_assets.dart';
import 'package:orpheus/utils/size_util.dart';

class SobrePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.image("background_historia.png")),
              alignment: Alignment.center,
              fit: BoxFit.cover,
            ),
          ),
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.all(20.width),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.75),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 10.width, vertical: 20.height),
                  child: Text(
                    'Sobre esta aplicação',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                    ),
                  ),
                ),
                Container(
                  height: 1,
                  color: Colors.black,
                ),
                Expanded(
                    child: SingleChildScrollView(
                  child: Container(
                    width: size.width - 35.width,
                    padding: EdgeInsets.symmetric(
                        horizontal: 10.width, vertical: 10.height),
                    child: Column(
                      children: [
                        Text(
                            "Este aplicativo foi feito para a exemplificação do uso de jogos eletrônicos no ensino e prática da teoria musical. Esta aplicação não possui qualquer forma de monetização.\nForam usadas imagens obtidas da internet para o desenvolvimento que estão listadas logo abaixo."),
                        Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.height)),
                        Image.asset(
                          AppAssets.image("bard_teacher.png"),
                          height: 150.height,
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(vertical: 1.height)),
                        Align(
                          alignment: Alignment.center,
                          child: Text("Nils - Fire Emblem Heroes"),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                              "https://guide.fire-emblem-heroes.com/wp-content/uploads/nils_bright_bard_slide01.png"),
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.height)),
                        Image.asset(
                          AppAssets.image("background_historia.png"),
                          width: 150.width,
                        ),
                        Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: 1.height)),
                        Align(
                          alignment: Alignment.center,
                          child: Text("Aether Raids - Fire Emblem Heroes"),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                              "https://feheroes.gamepedia.com/File:AetherRaids.png"),
                        ),
                      ],
                    ),
                  ),
                )),
                Container(
                  height: 1,
                  color: Colors.black,
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:orpheus/data/model/enum/tipo_jogo.dart';
import 'package:orpheus/data/model/enum/tipo_questao.dart';
import 'package:orpheus/data/model/nota_tentativa.dart';
import 'package:orpheus/data/model/resposta.dart';
import 'package:orpheus/data/model/tentativa.dart';
import 'package:orpheus/ui/feature/home/home_page.dart';

main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // final FirebaseApp app = await Firebase.initializeApp(
  //   name: 'db2',
  //   options: Platform.isIOS || Platform.isMacOS
  //       ? FirebaseOptions()
  //       : FirebaseOptions(
  //           appId: '1:944219617334:android:9185cb826e2918ee15c097',
  //         ),
  // );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.blueAccent));
    SystemChrome.setEnabledSystemUIOverlays([]);

    return MaterialApp(
      title: 'Orpheus',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashPage(),
    );
  }
}

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Hive.initFlutter().then((value) async {
      if (!Hive.isAdapterRegistered(5)) {
        Hive
          ..registerAdapter(TipoJogoAdapter())
          ..registerAdapter(TipoQuestaoAdapter())
          ..registerAdapter(NotaTentativaAdapter())
          ..registerAdapter(RespostaAdapter())
          ..registerAdapter(TentativaAdapter());
      }
      await Future.delayed(Duration(milliseconds: 1250));
      _redirect(context);
    });

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  Future<void> _redirect(BuildContext context) async {
    await Future.delayed(Duration(seconds: 3), () {});

    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
  }
}

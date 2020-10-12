import 'package:orpheus/data/model/enum/tipo_jogo.dart';
import 'package:orpheus/data/model/fala_historia.dart';
import 'package:orpheus/data/model/fase.dart';
import 'package:orpheus/data/model/historia.dart';
import 'package:orpheus/data/model/nota.dart';

class Falas {
  static List<Historia> lista = [
    Historia(0, falas: [
      FalaHistoria(0, ""),
      FalaHistoria(1, ""),
      FalaHistoria(2, ""),
    ]),
    Historia(1, falas: [
      FalaHistoria(0, ""),
      FalaHistoria(1, ""),
      FalaHistoria(2, ""),
    ]),
    Historia(2, falas: [
      FalaHistoria(0, ""),
      FalaHistoria(1, ""),
      FalaHistoria(2, ""),
    ]),
  ];
}

import 'package:orpheus/data/model/enum/tipo_questao.dart';
import 'package:orpheus/data/model/fala_historia.dart';
import 'package:orpheus/data/model/nota.dart';

import 'fala_historia.dart';

class Historia {
  int faseHistoria;
  List<FalaHistoria> falas;

  Historia(
    this.faseHistoria, {
    this.falas = const [],
  });
}

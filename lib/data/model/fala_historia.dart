import 'package:orpheus/data/model/enum/tipo_questao.dart';
import 'package:orpheus/data/model/nota.dart';

class FalaHistoria {
  int posicao;
  String texto;
  String imagem;

  FalaHistoria(
    this.posicao,
    this.texto, {
    this.imagem,
  });
}

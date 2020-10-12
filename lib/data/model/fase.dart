import 'package:orpheus/data/model/enum/tipo_jogo.dart';

class Fase {
  int nivelDificuldadeMinima;
  int nivelDificuldadeMaxima;
  int quantidadeAcertosPorNota;
  TipoJogo tipoJogo;

  Fase(
    this.tipoJogo, {
    this.nivelDificuldadeMinima = 0,
    this.nivelDificuldadeMaxima = 0,
    this.quantidadeAcertosPorNota = 10,
  });
}

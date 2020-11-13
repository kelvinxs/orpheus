import 'package:orpheus/data/model/enum/tipo_jogo.dart';

class Fase {
  int nivelPorTipo;
  int nivelNotaMinima;
  int nivelNotaMaxima;
  int quantidadeAcertosPorNota;
  TipoJogo tipoJogo;
  bool habilitada;
  String nome;

  Fase(
    this.tipoJogo, {
    this.nivelPorTipo = 0,
    this.nivelNotaMinima = 0,
    this.nivelNotaMaxima = 0,
    this.quantidadeAcertosPorNota = 10,
    this.habilitada,
    this.nome,
  });
}

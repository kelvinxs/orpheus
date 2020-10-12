import 'package:orpheus/data/model/enum/tipo_jogo.dart';
import 'package:orpheus/data/model/fase.dart';
import 'package:orpheus/data/model/nota.dart';

class Fases {
  static List<Fase> lista = [
    Fase(TipoJogo.HISTORIA,
        nivelDificuldadeMaxima: 0,
        nivelDificuldadeMinima: 0,
        quantidadeAcertosPorNota: 10),
    Fase(TipoJogo.HISTORIA,
        nivelDificuldadeMaxima: 1,
        nivelDificuldadeMinima: 0,
        quantidadeAcertosPorNota: 10),
    Fase(TipoJogo.HISTORIA,
        nivelDificuldadeMaxima: 2,
        nivelDificuldadeMinima: 0,
        quantidadeAcertosPorNota: 10),
    Fase(TipoJogo.SEM_FIM,
        nivelDificuldadeMaxima: 0,
        nivelDificuldadeMinima: 0,
        quantidadeAcertosPorNota: -1),
    Fase(TipoJogo.SEM_FIM,
        nivelDificuldadeMaxima: 1,
        nivelDificuldadeMinima: 0,
        quantidadeAcertosPorNota: -1),
    Fase(TipoJogo.SEM_FIM,
        nivelDificuldadeMaxima: 2,
        nivelDificuldadeMinima: 0,
        quantidadeAcertosPorNota: -1),
  ];
}

import 'package:orpheus/data/model/enum/tipo_jogo.dart';
import 'package:orpheus/data/model/fase.dart';

class Fases {
  static List<Fase> lista = [
    Fase(
      TipoJogo.HISTORIA,
      nivelPorTipo: 0,
      nivelNotaMaxima: 0,
      nivelNotaMinima: 0,
      quantidadeAcertosPorNota: 5,
      nome: "Lição 1: A Base de Tudo",
    ),
    Fase(
      TipoJogo.HISTORIA,
      nivelPorTipo: 1,
      nivelNotaMaxima: 1,
      nivelNotaMinima: 1,
      quantidadeAcertosPorNota: 5,
      nome: "Lição 2: Tom e Semitom",
    ),
    Fase(
      TipoJogo.HISTORIA,
      nivelPorTipo: 2,
      nivelNotaMaxima: 1,
      nivelNotaMinima: 0,
      quantidadeAcertosPorNota: 4,
      nome: "Lição 3: Uma Nova Forma para a Música",
    ),
    Fase(
      TipoJogo.SEM_FIM,
      nivelNotaMaxima: 0,
      nivelNotaMinima: 0,
      nivelPorTipo: 0,
      quantidadeAcertosPorNota: -1,
      nome: "Nível 1: Notas Básicas",
    ),
    Fase(
      TipoJogo.SEM_FIM,
      nivelNotaMaxima: 1,
      nivelNotaMinima: 0,
      nivelPorTipo: 1,
      quantidadeAcertosPorNota: -1,
      nome: "Nível 2: Sustenido e Bemol",
    ),
    Fase(
      TipoJogo.SEM_FIM,
      nivelPorTipo: 2,
      nivelNotaMaxima: 2,
      nivelNotaMinima: 0,
      quantidadeAcertosPorNota: -1,
      nome: "Nível 3: Partitura",
    ),
  ];
}

import 'package:orpheus/data/model/enum/tipo_questao.dart';
import 'package:orpheus/data/model/nota.dart';

class Questao {
  String idTentativa;
  int nivel;
  Nota notaPrincipal;
  List<Nota> opcoes;
  TipoQuestao tipo;
  int numAcertoNota;
  int numTentativasNota;
  int progressoFase;
  int idFase;

  Questao({
    this.idTentativa,
    this.nivel,
    this.notaPrincipal,
    this.tipo,
    this.opcoes,
    this.numAcertoNota,
    this.numTentativasNota,
    this.progressoFase,
  });
}

import 'package:orpheus/data/model/enum/tipo_questao.dart';
import 'package:orpheus/data/model/nota.dart';

class Questao {
  int idTentativa;
  int numero;
  int nivel;
  Nota notaPrincipal;
  List<Nota> opcoes;
  TipoQuestao tipo;
  int numAcertoNota;
  int numTentativasNota;
  int progressoFase;

  Questao({
    this.idTentativa = 0,
    this.numero = 1,
    this.nivel,
    this.notaPrincipal,
    this.tipo,
    this.opcoes,
    this.numAcertoNota,
    this.numTentativasNota,
    this.progressoFase,
  });
}

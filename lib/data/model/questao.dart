import 'package:orpheus/data/model/enum/tipo_questao.dart';
import 'package:orpheus/data/model/nota.dart';

class Questao {
  int numero;
  int nivel;
  Nota notaPrincipal;
  Nota opcao1;
  Nota opcao2;
  Nota opcao3;
  TipoQuestao tipo;

  Questao({
    this.numero = 1,
    this.nivel,
    this.notaPrincipal,
    this.tipo,
    this.opcao1,
    this.opcao2,
    this.opcao3,
  });
}

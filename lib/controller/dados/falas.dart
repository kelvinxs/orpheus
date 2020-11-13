import 'package:orpheus/data/model/enum/tipo_jogo.dart';
import 'package:orpheus/data/model/fala_historia.dart';
import 'package:orpheus/data/model/fase.dart';
import 'package:orpheus/data/model/historia.dart';
import 'package:orpheus/data/model/nota.dart';

class Falas {
  static List<Historia> lista = [
    Historia(
      0,
      falas: [
        FalaHistoria(
          0,
          "Hoooo, então é você que anda procurando alguem que possa te ensinar sobre música.",
        ),
        FalaHistoria(
          1,
          "A sua busca chegou ao fim! Diante de ti está o maior bardo que esse mundo já teve!",
        ),
        FalaHistoria(
          2,
          "An? Não acredita em mim?\nVou te mostrar então um pouco de minhas habilidades então.",
        ),
        FalaHistoria(
          3,
          "~O estranho bardo começa a tocar uma melodia tão bela que faz qualquer um desejar nunca acabar~",
        ),
        FalaHistoria(
          4,
          "Então? Agora acredita em mim?",
        ),
        FalaHistoria(
          5,
          "Ótimo, então que tal começarmos agora as aulas?\nMe diga, o que sabe sobre música?",
        ),
        FalaHistoria(
          6,
          "Entendo, então realmente é um novato. Será difícil se não conseguir ler cifras e partituras.",
        ),
        FalaHistoria(
          7,
          "Mas não se preocupe, vou te ensinar tudo isso! Vamos começar pelas notas musicais!",
        ),
        FalaHistoria(
          8,
          "O que chamamos de notas são certos sons que servem de base para quase tudo na música.",
        ),
        FalaHistoria(
          9,
          "Não são muitas notas, e provavelmente já ouviu falar nelas!",
        ),
        FalaHistoria(
          10,
          "Nós temos as notas 'Dó', 'Ré', 'Mi', 'Fá', 'Sol', 'Lá' e 'Si'.\nBem simples né?",
        ),
        FalaHistoria(
          11,
          "Com essas notas como base podemos gerar diversos sons combinando elas ou modificando um pouco!",
        ),
        FalaHistoria(
          12,
          "Ah, falei algo complicado no final?\nSem problemas! Mais pra frente vou ensinar melhor sobre mudar ou combinar notas.",
        ),
        FalaHistoria(
          13,
          "Mas voltando sobre as notas bases, para facilitar a escrita e leitura de uma música criamos algumas formas de representar essas notas.",
        ),
        FalaHistoria(
          14,
          "Uma delas é a CIFRA. Quando escrevemos músicas com esse sistema usamos algumas letras e símbolos para descrever uma nota.",
        ),
        FalaHistoria(
          15,
          "Por exemplo, as notas básicas que falei antes, cada uma tem uma letra pra representar cada uma delas, indo de A até a letra G!",
        ),
        FalaHistoria(
          16,
          "As notas básicas em sua forma de cifra são:\n"
          "Lá - A | Si - B\n"
          "Dó - C | Ré - D\n"
          "Mi - E | Fá - F\n"
          "Sol - G",
        ),
        FalaHistoria(
          17,
          "Bem simples né?\nMas acho que você só me ouvir não vai ser o sulficiente. Que tal praticar um pouco?",
        ),
      ],
    ),
    Historia(
      1,
      falas: [
        FalaHistoria(
          0,
          "Bem vindo de volta! Achei que não iria mais voltar...",
        ),
        FalaHistoria(
          1,
          "Digo, sabia que voltaria! E pela sua cara parece já ter se acostumado com as notas básicas.",
        ),
        FalaHistoria(
          2,
          "Você realmente aprende rápido. Acho que já posso te ensinar algo um pouco mais complexo.",
        ),
        FalaHistoria(
          3,
          "Lembra que eu disse que é possível modificar um pouco as notas?",
        ),
        FalaHistoria(
          4,
          "Uma das formas é alterar o tom para obter uma nova nota.",
        ),
        FalaHistoria(
          5,
          "O que é tom? Calma, já vou explicar.",
        ),
        FalaHistoria(
          6,
          "Tom é a distância entre duas notas. Então se eu mudar a nota de C para D, então eu SUBI a nota em um TOM.",
        ),
        FalaHistoria(
          7,
          "Se eu mudar a nota de D para C, então eu DESCI a nota em um TOM.",
        ),
        FalaHistoria(
          8,
          "Mas tambêm podemos \"parar\" no meio do caminho e mudar a nota usando apenas a metade de um tom. Chamamos a metade de um TOM um SEMITOM.",
        ),
        FalaHistoria(
          9,
          "E é ai que temos novas notas!",
        ),
        FalaHistoria(
          10,
          "Quando subimos uma nota em um SEMITOM adicionamos um novo termo para a nota chamada SUSTENIDO.",
        ),
        FalaHistoria(
          11,
          "O SUSTENIDO é representado pelo símbolo #. Assim uma nota com SUSTENIDO é representada pela letra da nota de base junto ao #.\nPor exemplo: C# e G#",
        ),
        FalaHistoria(
          12,
          "Já quando descemos uma nota em um SEMITOM chamamos isto de BEMOL.",
        ),
        FalaHistoria(
          13,
          "O BEMOL é representado pelo símbolo ♭. E assim como o SUSTENIDO, para notas com BEMOL temos, por exemplo: C♭ e G♭",
        ),
        FalaHistoria(
          14,
          "Mas nem todas as notas conseguimos subir ou descer um SEMITOM. Isso porquê a distância entre ela e a nota seguinte ou anterior é de 1 SEMITOM e não de 1 TOM",
        ),
        FalaHistoria(
          15,
          "Fique tranquilo, são apenas dois casos em que isso ocorre. Apenas as notas E e B não tem SUSTENIDO e assim as notas F e C não possuem BEMOL",
        ),
        FalaHistoria(16, "Agora chega de papo e vamos praticar!")
      ],
    ),
    Historia(
      2,
      falas: [
        FalaHistoria(
          0,
          "Oh, já voltou? Pensei que levaria mais tempo pra absorver o conteúdo da aula passada.",
        ),
        FalaHistoria(
          1,
          "Acho que te subestimei demais! Hahahahaha",
        ),
        FalaHistoria(
          2,
          "Bem, acho que está pronto para aprender sobre uma outra forma de representar as notas antes de aprender sobre ACORDES.",
        ),
        FalaHistoria(
          2,
          "Ei, não se preocupe, não é tão difícil quanto parece. Aposto que vai entender em pouco tempo!",
        ),
        FalaHistoria(
          2,
          "O conceito das notas básicas e de subir ou descer em um SEMITOM se mantem, o que muda é como escrevemos no papel.",
        ),
        FalaHistoria(
          2,
          "Você já deve ter visto por aí alguns bardos com papeis com alguns destes símbolos.",
          imagem: "",
        ),
        FalaHistoria(
          2,
          "Estes símbolos são utilizados no sistema de PARTITURAS.",
        ),
        FalaHistoria(
          2,
          "Neste modelo não usamos letras. No lugar delas usamos símbolos e onde o símbolo está posicionado. Aqui, deixa eu te mostrar",
          imagem: "clave_sol.png",
        ),
        FalaHistoria(
          2,
          "Para representar uma nota utilizamos este símbolo.",
          imagem: "simbolo_nota_partitura.png",
        ),
      ],
    ),
  ];
}

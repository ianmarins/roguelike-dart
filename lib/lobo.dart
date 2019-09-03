import 'dart:math';
import 'package:roguelike/mundo.dart';
import 'package:roguelike/personagem.dart';
import 'package:roguelike/ponto_2d.dart';
//import 'package:roguelike/jogador.dart';

// Classe Criatura é derivada (filha) da classe Personagem
class Lobo extends Personagem {
  // Constantes
  static final int FICAR_PARADO = 0;
  static final int MOVER_BAIXO = 1;
  static final int MOVER_CIMA = 2;
  static final int MOVER_DIREITA = 3;
  static final int MOVER_ESQUERDA = 4;
  static final int QUANTIDADE_MOVIMENTOS = 5;
  static final String SIMBOLO_CRIATURA_LOBO = "L";
  
  var direcaoToJogadorX;
  var direcaoToJogadorY;


  // Variável privada para criar números aleatório
  Random _aleatorio;

  // Construtor padrão + Construtor do pai (super)
  Lobo(Ponto2D posicao, String simbolo) : super(posicao, simbolo) {
    // Random(SEED)
    // SEED = NULL indica que vai pegar o tempo atual
    _aleatorio = Random(null);
  }

  // Implementação do método abstrato atualizar
  // @mundo: mundo em que o personagem esta no momento
  void atualizar(Mundo mundo) {
    // criar um número aleatório entre 0 e 100,
    // logo em seguida, calcula o resto da divisão por 5,
    // ou seja, só podemos ter os seguintes valores: 0, 1, 2, 3 e 4
    //var direcao = _aleatorio.nextInt(1000) % QUANTIDADE_MOVIMENTOS;
  
    if(mundo.jogador.posicao.x > 50 && mundo.jogador.posicao.y > 20 ){
         mover(mundo, 1, 1); //mover para direia e para baixo

    } else if (mundo.jogador.posicao.x > 50 && mundo.jogador.posicao.y < 20) {
         mover(mundo, 1, -1); //para direita e para cima 
    }
    else if (mundo.jogador.posicao.x < 50 && mundo.jogador.posicao.y < 20) {
         mover(mundo, -1, 1); // para esquerda e para baixo
   
    } else if (mundo.jogador.posicao.x < 50 && mundo.jogador.posicao.y > 20) {
         mover(mundo, -1, -1); // para esquerda e para cima
    }  
    
    
  }


  void atacar(Mundo mundo){

      //jogador.posicao.toString()


  }
}

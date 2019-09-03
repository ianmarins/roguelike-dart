import 'dart:io';
import 'package:roguelike/mundo.dart';
import 'package:roguelike/personagem.dart';
import 'package:roguelike/ponto_2d.dart';
import 'dart:math';


// Classe Jogador é derivada (filha) da classe Personagem
class Tesouro extends Personagem {
  // Constantes
  
  static final String SIMBOLO_TESOUSO = "G";
  static final int VALOR_TESOURO = 10;  //TESTE


  int tesouroPlayer;
  int _valorTesouro = 100; 
  int passos; // Variável publica

   

  // Getter para variável valor 
  int get tesouroValor => _valorTesouro; 

  // Construtor padrão + Construtor do pai (super)
  Tesouro(Ponto2D posicao, String simbolo, this._valorTesouro)      : super(posicao, simbolo) {
    
  }
  
  bool contemValor() => _valorTesouro > 0;

 

  void pegarValorTesouro(Mundo mundo) {
    mundo.jogador.valorTesouro = this._valorTesouro;
  }

      

void atualizar(Mundo mundo)
  {
    
    if(this.posicao.toString() == mundo.jogador.posicao.toString())
    {
      this.posicao.x = null;
      this.posicao.y = null;
    }
  }
    
}

   


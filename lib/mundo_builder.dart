import 'dart:math';
import 'package:roguelike/celula.dart';
import 'package:roguelike/criatura.dart';
import 'package:roguelike/mundo.dart';
import 'package:roguelike/ponto_2d.dart';
import 'package:roguelike/lobo.dart';
import 'package:roguelike/carneiro.dart';
import 'package:roguelike/tesouro.dart';

// Classe que criará mundos seguindo o padrão Builder
class MundoBuilder {
  // Constantes
  static final String SIMBOLO_PASSAGEM = ".";

  // Variáveis
  int largura, altura;
  List<List<Celula>> mapa;
  List<Criatura> criaturas;
  List<Lobo> lobos;
  List<Carneiro> carneiros;
  List<Tesouro> tesouros;


  // Construtor padrão
  MundoBuilder(this.largura, this.altura) {
    criaturas = [];
    lobos = [];
    carneiros = [];
    tesouros = [];
  }

  // Método para preencher o mapa (passo 1 da heurística)
  MundoBuilder preencher(String simbolo, bool bloqueado) {
    // Cria uma matriz X, Y com Células
    mapa = List.generate(
        largura,
        (int x) => List.generate(
            altura, (int y) => Celula(Ponto2D(x, y), simbolo, bloqueado)));
    return this;
  }

  // Método para criar o caminho (passagem)
  // @x : início do personagem na posição X
  // @y : início do personagem na posição Y
  // @passos : quantidade de passos para o personagem sergui a bússola
  MundoBuilder criarCaminho(int x, int y, int passos) {
    // Inicia a bússola quebrada (gerador de número aleatório)
    Random bussola = Random(null);
    // Realiza os K passados
    for (int i = 0; i < passos; i++) {
      // Verifica o novo norte da heurístíca
      var norte = bussola.nextInt(4);

      // Desloca o jogador para o norte apontado (sem atravessar as paredes)
      if (norte == 0 && (x + 1) < (largura - 1)) {
        x += 1;
      } else if (norte == 1 && (x - 1) > 0) {
        x -= 1;
      } else if (norte == 2 && (y + 1) < (altura - 1)) {
        y += 1;
      } else if (norte == 3 && (y - 1) > 0) y -= 1;

      // Troca a parede por uma passagem
      mapa[x][y] = Celula(Ponto2D(x, y), SIMBOLO_PASSAGEM, false);
    }

    return this;
  }

  // Método que adiciona criaturas no mapa
  // @quantidadeCriaturas : número de criaturas que queremos colocar no mapa
  MundoBuilder criarCriaturas(int quantidadeCriaturas, String SIMBOLO_CRIATURAS) { //PODE SER LOBO ou CARNEIRO, VEM DO ROGUELIKE
    // cria um número aleatório
    Random aleatorio = Random();
    int x, y;
    // Cria N criaturas
    for (int i = 0; i < quantidadeCriaturas; i++) {
      // Impede que uma criatura seja criada em cima de uma parede
      do {
        x = aleatorio.nextInt(largura);
        y = aleatorio.nextInt(altura);
      } while (mapa[x][y].bloqueado);

      if(SIMBOLO_CRIATURAS == Criatura.SIMBOLO_CRIATURA_CARNEIRO){
        carneiros.add(Carneiro(Ponto2D(x, y), Carneiro.SIMBOLO_CRIATURA_CARNEIRO));
        
      }else{
        lobos.add(Lobo(Ponto2D(x, y), Lobo.SIMBOLO_CRIATURA_LOBO)); //CRIA LOBO
      }

      // Adiciona a criatura na lista de criaturas
      //criaturas.add(Criatura(Ponto2D(x, y), SIMBOLO_CRIATURAS));
      //criaturas.add(Criatura(Ponto2D(x, y), Criatura.SIMBOLO_CRIATURA_CARNEIRO));
      //criaturas.add(Criatura(Ponto2D(x, y), Criatura.SIMBOLO_CRIATURA_LOBO));
    }
    return this;
  }


  MundoBuilder criarTesouro(int quantidadeTesouro, String SIMBOLO_CRIATURAS) { 
    // cria um número aleatório
    Random aleatorio = Random();
    int x, y;
    // Cria N criaturas
    for (int i = 0; i < quantidadeTesouro; i++) {
      
      do {
        x = aleatorio.nextInt(largura);
        y = aleatorio.nextInt(altura);
      } while (mapa[x][y].bloqueado);

     
        tesouros.add(Tesouro(Ponto2D(x, y), Tesouro.SIMBOLO_TESOUSO, Tesouro.VALOR_TESOURO));
        
     

    
    }
    return this;

  }




  // Retorna um Mundo
  Mundo build() {
    return Mundo(mapa, lobos, carneiros, tesouros);
  }
}

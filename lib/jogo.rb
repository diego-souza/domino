#encoding: utf-8
require 'exceptions'
require 'jogador'
class Jogo
  attr_reader :jogadores, :pilha
  PEDRAS_DO_JOGO = (0..6).to_a.repeated_combination(2).to_a

  def initialize(*nomes)
     raise NumeroJogadoresException unless (2..4).include? nomes.size
     @jogadores = []
     @pilha = PEDRAS_DO_JOGO.shuffle
     nomes.each do |nome|
       @jogadores << Jogador.new(nome)
     end
  end

  def distribuir_pedras
    @jogadores.each do |jogador|
      jogador.pedras = @pilha.pop(7)
    end
  end
end

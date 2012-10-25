#encoding: utf-8
require 'exceptions'
require 'jogador'
require 'regras'
class Jogo
  attr_reader :jogadores, :pilha, :jogador_da_vez
  PEDRAS_DO_JOGO = (0..6).to_a.repeated_combination(2).to_a

  def initialize(*nomes)
     raise NumeroJogadoresException unless (2..4).include? nomes.size
     @jogadores = []
     nomes.each do |nome|
       @jogadores << Jogador.new(nome)
     end
     comecar
  end

  private
  def comecar
    while @jogador_da_vez.nil? do
      @pilha = PEDRAS_DO_JOGO.shuffle
      distribuir_pedras
      @jogador_da_vez = Regras.primeiro_jogador @jogadores
    end
  end

  def distribuir_pedras
    @jogadores.each do |jogador|
      jogador.pedras = @pilha.pop(7)
    end
  end
end

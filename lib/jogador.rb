#encoding: utf-8
class Jogador
  attr_reader :nome
  attr_accessor :pedras
  def initialize(nome)
    @nome = nome
    @pedras = []
  end

  def maior_pedra_dupla
    maior = -1
    (0..6).each do |i|
      maior = i if @pedras.include? [i,i]
    end
    maior
  end
end

#encoding: utf-8
class Jogador
  attr_reader :nome
  attr_accessor :pedras
  def initialize(nome)
    @nome = nome
    @pedras = []
  end
end

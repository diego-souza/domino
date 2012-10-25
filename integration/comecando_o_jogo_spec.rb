#encoding: utf-8
require 'jogo'
describe "Começo de um jogo" do
  it "inicializando o jogo" do
    jogo = Jogo.new "Rodrigo", "Abraão"
    jogo.comecar
    jogo.jogador_da_vez
  end
end

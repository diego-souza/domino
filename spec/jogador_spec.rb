#encoding: utf-8
require 'jogador'
describe Jogador do
  it "deveria ter nome" do
    jogador = Jogador.new("Nome")
    jogador.nome.should == "Nome"
  end

  it "deveria não ter pedras no inicio" do
    jogador = Jogador.new("Nome")
    jogador.pedras.should == []
  end

  it "deveria setar pedras" do
    jogador = Jogador.new("Nome")
    pedras = [[2,3]]
    jogador.pedras = pedras
    jogador.pedras.should == pedras
  end
end

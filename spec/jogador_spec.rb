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

  describe "#maior_pedra_dupla" do
    it "deveria retornar -1 se não tiver nenhuma pedra dupla" do
      jogador = Jogador.new("Nome")
      pedras = [[2,3]]
      jogador.pedras = pedras
      jogador.maior_pedra_dupla.should == -1
    end

    it "deveria retornar o numero da maior pedra dupla caso a tenha" do
      jogador = Jogador.new("Nome")
      pedras = [[6,6], [3,3]]
      jogador.pedras = pedras
      jogador.maior_pedra_dupla.should == 6
    end
  end
end

require 'regras'
describe Regras do
  describe ".primeiro_jogador" do
    it "deve retornar o jogador caso algum jogador tenha pedra dupla" do
      jogador = stub(:maior_pedra_dupla => 5)
      primeiro_jogador = stub(:maior_pedra_dupla => 6)
      jogadores = [jogador, primeiro_jogador]
      Regras.primeiro_jogador(jogadores).should == primeiro_jogador
    end

    it "deve retornar o nil caso nenhum jogador tenha pedra dupla" do
      jogador = stub(:maior_pedra_dupla => -1)
      primeiro_jogador = stub(:maior_pedra_dupla => -1)
      jogadores = [jogador, primeiro_jogador]
      Regras.primeiro_jogador(jogadores).should be_nil
    end
  end
end

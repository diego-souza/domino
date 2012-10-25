#encoding: utf-8
require 'jogo'
describe Jogo do
  it "não deve ser inicializado com menos de 2 jogadores" do
    expect { Jogo.new "Rennan" }.to raise_error NumeroJogadoresException
  end

  it "deve poder ser inicializado com mais de 1 jogador" do
    jogo = Jogo.new "Rennan", "Igor"
    jogo.jogadores.size.should == 2
  end

  it "não deve ser inicializado com mais de 4 jogadores" do
    expect { Jogo.new "Rennan", "Hugo", "Igor", "Hudson", "Diego" }.to raise_error NumeroJogadoresException
  end

  describe "#distribuir_pedras" do
    it "deve distribuir 7 pedras para cada jogador" do
      jogo = Jogo.new "Rennan", "Igor"
      jogo.distribuir_pedras
      jogo.jogadores.each do |jogador|
        jogador.pedras.size.should == 7
      end
    end

    it "a pilha deve ter 14 caso existam 2 jogadores" do
      jogo = Jogo.new "Rennan", "Igor"
      jogo.distribuir_pedras
      jogo.pilha.size.should == 14
    end

    it "a pilha deve estar vazia caso existam 4 jogadores" do
      jogo = Jogo.new "Rennan", "Igor", "Hugo", "Hudson"
      jogo.distribuir_pedras
      jogo.pilha.should be_empty
    end
  end

  describe "#comecar" do
    it "deve definir primeiro jogador" do
      jogo = Jogo.new "Rennan", "Igor"
      primeiro_jogador = stub
      Regras.should_receive(:primeiro_jogador).and_return(primeiro_jogador)
      jogo.comecar
      jogo.jogador_da_vez.should == primeiro_jogador
    end

    it "deve distribuir pedras enquanto não houver jogador da vez" do
      jogo = Jogo.new "Rennan", "Igor"
      primeiro_jogador = stub
      jogo.should_receive(:distribuir_pedras).twice
      Regras.should_receive(:primeiro_jogador).and_return(nil)
      Regras.should_receive(:primeiro_jogador).and_return(primeiro_jogador)
      jogo.comecar
      jogo.jogador_da_vez.should == primeiro_jogador
    end

    it "deve recarregar pilha a cada distribuição" do
      jogo = Jogo.new "Rennan", "Igor"
      Regras.should_receive(:primeiro_jogador).and_return(nil)
      Regras.should_receive(:primeiro_jogador).and_return(stub)
      jogo.comecar
      jogo.pilha.size.should == 14
    end

    it "deve ser inicializado com as pedras de forma aleatória" do
      jogo = Jogo.new "Rennan", "Hugo"
      Jogo::PEDRAS_DO_JOGO.should_receive(:shuffle).and_return(Jogo::PEDRAS_DO_JOGO)
      jogo.comecar
    end
  end

#  describe "#jogador_da_vez" do
#    it "" do
#      jogo = Jogo.new "Rennan", "Igor", "Hugo", "Hudson"
#      jogo.jogador_da_vez
#    end
#  end
end

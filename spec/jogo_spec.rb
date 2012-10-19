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

  it "deve ser inicializado com todas as pedras na pilha" do
    jogo = Jogo.new "Rennan", "Hugo"
    jogo.pilha.size.should == 28
  end

  it "deve ser inicializado com as pedras de forma aleatória" do
    Jogo::PEDRAS_DO_JOGO.should_receive(:shuffle)
    jogo = Jogo.new "Rennan", "Hugo"
  end

  describe "#distribuir" do
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

  describe "#tem_primeiro_jogador?" do
    it "deve retornar true caso algum jogador tenha pedra dupla" do
      jogo = Jogo.new "Rennan", "Igor", "Hugo", "Hudson"
    end
  end
end

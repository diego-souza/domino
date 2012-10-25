class Regras
  def self.primeiro_jogador jogadores
    maior = -1
    jogador_com_maior_pedra_dupla = nil
    jogadores.each do |jogador|
      if maior < jogador.maior_pedra_dupla
        maior = jogador.maior_pedra_dupla
        primeiro_jogador = jogador
        jogador_com_maior_pedra_dupla
      end
    end
    jogador_com_maior_pedra_dupla
  end
end

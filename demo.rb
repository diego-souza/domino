require 'domino'

jogo = Jogo.new "Rennan", "Igor", "Hugo", "Hudson"

jogo.jogadores
jogo.jogadores.first.nome
jogo.jogadores.first.pedras
jogo.area_de_jogo

while !jogo.terminou?
 jogo.jogar
end

jogo.ganhador

###
jogo.distribuir_pedras

jogo.jogador_da_vez

pedras = jogo.mostrar_pedras game.jogador_da_vez

pedra = 

jogo.play jogo.jogador_da_vez, pedra


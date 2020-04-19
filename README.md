# Relogio
Projeto final do curso de Eletronica Digital em VHDL, que consiste em simular um relogio digital na placa FPGA. Para isso, utiliza-se o display de 7 segmentos da placa.
Porem, a placa esta limitada a mostrar apenas 4 digitos por vez, enquanto que a simulacao deve levar em conta as horas, minutos e segundos, totalizando 6 digitos.
A solucao encontrada foi configurar uma chave que possibilite alternar mm:ss e hh:mm.
Por exemplo, utilizemos 13 horas, 25 minutos e 43 segundos, ou seja, 13:25:43.
Com a chave desativada, e mostrado os minutos e segundos, ou seja, 25:43 conforme nosso exemplo.
Quando ativamos a chave, mostra-se 13:25.

A frequencia do clock (fclk) foi aumentada propositalmente com o intuito de observar o comportamento do relogio quando chega em 23:59:59, onde deve zerar, sinalizando que ja se passaram as 24 horas necessarias para que o relogio reinicie.

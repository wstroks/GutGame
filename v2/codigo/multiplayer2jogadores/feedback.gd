extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var a=0
var b=0
var nome1=""
var nome2=""
var score1=0
var score2=0
var tabuleiro1=0
var tabuleiro2=0
var estado=str(multi_player._playerondevai1())
# Called when the node enters the scene tree for the first time.
func _ready():
	tabuleiro1=multi_player.tabuleiro1infor()
	tabuleiro2=multi_player.tabuleiro2infor()
	
	score1=multi_player._scoreplayer1()
	score2=multi_player._scoreplayer2()
	print("jogador 1")
	print(score1)
	print(multi_player.seta1)
	print("jogador 2")
	print(score2)
	print(multi_player.seta2)
	 
	if(score1<3 && score2<3 &&tabuleiro1!=9 && tabuleiro2!=9):
	 	get_node("jogarNovamente3").show()
	 	get_node("sentimento").set_texture(load("res://img/triste_feed.png"))
	 	get_node("Label").set_text("Jogador 1 e Jogador 2 não conseguiram avançar, tente novamente para passar para próxima casa!") 
		
	if(score1>=3 && score2>=3 &&tabuleiro1!=9 && tabuleiro2!=9):
		get_node("Seguir").show()
		get_node("Label").set_text("Parábens vocês conseguiram avançar, o jogador 1 irá para o "+multi_player._infoplayer1()+" e o jogador 2 para a "+multi_player._infoplayer2()+"!")
		
	if(score1<3 && score2>=3 &&tabuleiro1!=9 && tabuleiro2!=9):
		get_node("Seguir").show()
		get_node("Label").set_text("Parábens Jogador 2 você conseguiu avançar para a "+multi_player._infoplayer2()+", já o jogador 1 permanece ainda na "+multi_player._infoplayer1()+"!")
	if(score1>=3 && score2<3 &&tabuleiro1!=9 && tabuleiro2!=9):
		get_node("Seguir").show()
		get_node("Label").set_text("Parábens Jogador 1 você conseguiu avançar para o "+multi_player._infoplayer1()+", já o jogador 2 permanece ainda no "+multi_player._infoplayer2()+"!") 	
	if(tabuleiro1==9 && tabuleiro2!=9):
		get_node("Label").set_text("Parábens Jogador 1 você venceu o Gutgame! Vamos jogar novamente, volte ao Menu inicial") 
	if(tabuleiro1!=9 && tabuleiro2==9):
		get_node("Label").set_text("Parábens Jogador 2 você venceu o Gutgame! Vamos jogar novamente, volte ao Menu inicial")		
	if(tabuleiro1==9 && tabuleiro2==9):
		get_node("Label").set_text("Parábens Jogador 1 e ao Jogador 2 você empataram no Gutgame! Vamos jogar novamente, volte ao Menu inicial")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass


func _on_Seguir_pressed():
	if(b==0):
		get_node("corpo").show()
		get_node("sentimento").hide()
		get_node("Label").set_text("Preparado para o próximo Turno?!")
		get_node("jogador1-casa"+str(tabuleiro1)).show()
		get_node("jogador2-casa"+str(tabuleiro2)).show()
		
		
	if(b==1):
		get_tree().change_scene(str(multi_player._playerondevai1()))
	b=1
	
	
	pass # Replace with function body.


func _on_Menu_pressed():
	get_tree().change_scene("res://codigo/telas/tela_jogo.tscn")
	pass # Replace with function body.


func _on_jogarNovamente3_pressed():
	if(a==0):
		get_node("corpo").show()
		get_node("sentimento").hide()
		get_node("jogarNovamente3").hide()
		get_node("Label").set_text("Preparado para o novo Turno, vamos tentar novamente!")
		get_node("Seguir2").show()
		get_node("jogador1-casa"+str(tabuleiro1)).show()
		get_node("jogador2-casa"+str(tabuleiro2)).show()
		a=1
		
	
	pass # Replace with function body.


func _on_Seguir2_pressed():
	if(a==1):
		get_tree().change_scene(str(multi_player._playerondevai1()))
	
	pass # Replace with function body.

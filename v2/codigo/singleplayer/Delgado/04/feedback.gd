extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var a=0
var b=0
var erros=0
var score=new_script._singleInfoScore()
var estado=new_script._singleEstado()
# Called when the node enters the scene tree for the first time.
func _ready():
	score=new_script._singleInfoScore()
	estado=new_script._singleEstado()
	erros=5-score
	get_node("Label2").set_text("Quantidade de Erros/Acertos\n Acertos: "+str(score)+"       Erros: "+str(erros))
	
	
	if(score<3):
	 	get_node("jogarNovamente3").show()
	 	get_node("sentimento").set_texture(load("res://img/triste_feed.png"))
	 	get_node("Label").set_text("Você não acertou o número minimo para avançar, tente novamente para passar para próxima fase") 
		
	if(score>=3):
		get_node("Seguir").show()
		get_node("Label").set_text("Parábens você conseguiu avançar e agora vamos para a próxima casa do Intestino Delgado!") 
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass


func _on_Seguir_pressed():
	if(b==0):
		get_node("corpo").show()
		get_node("sentimento").hide()
		get_node("Label2").hide()
		get_node("TextureRect2").hide()
		get_node("Label").set_text("Agora estamos avançando para casa 5 do Intestino Delgado, preparado?!")
		get_node("seta2").show()
		
	if(b==1):
		get_tree().change_scene("res://codigo/singleplayer/Delgado/05/Quiz.tscn")
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
		get_node("Label2").hide()
		get_node("TextureRect2").hide()
		get_node("Label").set_text("Você ainda está na mesma posição 4, que corresponde ao Intestino Delgado!")
		get_node("Seguir2").show()
		get_node("seta1").show()
		a=1
		
	
	pass # Replace with function body.


func _on_Seguir2_pressed():
	if(a==1):
		get_tree().change_scene("res://codigo/singleplayer/Delgado/04/Quiz.tscn")
	
	pass # Replace with function body.

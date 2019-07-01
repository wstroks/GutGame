extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var a=0
var b=0
var score=new_script._singleInfoScore()
var estado=new_script._singleEstado()
# Called when the node enters the scene tree for the first time.
func _ready():
	score=new_script._singleInfoScore()
	estado=new_script._singleEstado()
	
	
	if(score<3):
	 	get_node("jogarNovamente3").show()
	 	get_node("sentimento").set_texture(load("res://img/triste_feed.png"))
	 	get_node("Label").set_text("Você não acertou o número minimo para avançar, tente novamente para passar para próxima fase") 
		
	if(score>=3):
		get_node("Seguir").show()
		get_node("Label").set_text("Parábens você Completou todo o jogo do Gutgame e com isso obteve conhecimento a respeito de partes do corpo de suma importância!!") 
	pass # Replace with function body.
	if(b==1):
		get_node("Seguir").hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass


func _on_Seguir_pressed():
	if(b==0):
		get_node("corpo").show()
		get_node("sentimento").hide()
		get_node("Label").set_text("Retorne ao Menu inicial e comece um nova jornada!!")
		get_node("Seguir").hide()
		
	
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
		get_node("Label").set_text("Você ainda está na mesma posição 8, que corresponde ao Intestino Grosso!")
		get_node("Seguir2").show()
		get_node("seta1").show()
		a=1
		
	
	pass # Replace with function body.


func _on_Seguir2_pressed():
	if(a==1):
		get_tree().change_scene("res://codigo/singleplayer/grosso/08/Quiz.tscn")
	
	pass # Replace with function body.

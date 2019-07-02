extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Label").set_text("Primeiro decida entre você e seu amigo quem será o jogador 1 e jogador 2, lembre das cores da seta que correspondem a cada jogador! Após a escolha clique em seguir e inicie o jogo!")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TextureButton_pressed():
	get_tree().change_scene("res://codigo/multiplayer2jogadores/01/Boca/Quiz.tscn")
	
	pass # Replace with function body.

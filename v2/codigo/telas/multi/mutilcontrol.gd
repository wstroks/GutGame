extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_2jogadores_pressed():
	audio_player.play_click()
	get_tree().change_scene("res://codigo/multiplayer2jogadores/TelainicialMulti.tscn")
	
	pass # Replace with function body.


func _on_3jogadores_pressed():
	pass # Replace with function body.


func _on_4jogadores_pressed():
	pass # Replace with function body.


func _on_voltar_pressed():
	audio_player.play_click()
	get_tree().change_scene("res://codigo/telas/tela_jogo.tscn")
	pass # Replace with function body.

extends EventPlayer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass


func _on_boca_pressed():
	audio_player.play("Click")
	get_tree().change_scene("res://BocaEesofago/apresenta.tscn")
	pass # replace with function body


func _on_pancreas_pressed():
	audio_player.play("Click")
	get_tree().change_scene("res://Codigo/escolha.tscn")
	pass # replace with function body


func _on_figado_pressed():
	audio_player.play("Click")
	get_tree().change_scene("res://Codigo/escolha.tscn")
	pass # replace with function body

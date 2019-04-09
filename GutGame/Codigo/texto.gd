extends RichTextLabel
var a= 1
# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var ALIGN_CENTER = 1
var page=0
var dialogo=[ "Oi, meu nome é Victor, hoje vamos aprender sobre o sistema digestório que compreende regiões por onde passa o alimento, como a boca, faringe, esôfago, estômago, intestinos delgado e grosso, entre outros.","Então agora vamos jogar? na proxima tela escolha qual opção deseja iniciar nossa jornada para conhecer o sistema digestório. "]
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_bbcode(dialogo[page])
	
	ALIGN_CENTER=1

	set_visible_characters(0)
	set_process_input(true)
	pass

func _input(event):
	if event.type == InputEvent.MOUSE_BUTTON && event.is_pressed():
		if get_visible_characters() > get_total_character_count():
			if page < dialogo.size()-1:
				page+=1
				print(page)
				if page == 1:
					get_parent().get_node("seguir").show()
				set_bbcode(dialogo[page])
				set_visible_characters(0)
		else:
			set_visible_characters(get_total_character_count())
			
func _on_Timer_timeout():
	
	set_visible_characters(get_visible_characters()+1)
	pass # replace with function body



	pass # replace with function body


func _on_seguir_pressed():
	audio_player.play("Click")
	get_tree().change_scene("res://Codigo/escolha.tscn")
	pass # replace with function body

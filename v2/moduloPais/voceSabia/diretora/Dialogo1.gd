extends RichTextLabel

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var a= 1

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var page=0
var dialogo=["Oi, meu nome é Carla sou a diretora da escola que João estuda. Meu objetivo sempre foi trabalhar em prol do desenvolvimento pedagógico.","Sempre oriento aos meus docentes a saberem sobre o que é educação inclusiva. Você sabe o que é?!","A educação inclusiva é a valorização da igualdade ao acesso à educação, contemplando assim as diversidades culturais, sensoriais, dentre outras.","João é um aluno muito inteligente e esforçado, recentemente foi diagnosticado com um Transtorno Específico de Aprendizado (TEA). Sendo feito pela nossa equipe multidiciplinar composta por (psicólogos, professores, fonoaudiólogos, dentre outros)." ,"Após a intervenção da equipe foi avaliado que João é disléxico. Com isso, é importante você como pai saber o que é dislexia, então vou fazer algumas perguntas, responda a alternativa que achar melhor!!"]
func _ready():
	set_bbcode(dialogo[page])
	
	
	
	set_visible_characters(0)
	set_process_input(true)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _input(event):
	if Input.is_action_pressed("ui_accept"):
		if get_visible_characters() > get_total_character_count():
			if page < dialogo.size()-1:
				page+=1
				print(page)
				if(page==2):
					_on_balao_hide()
				if(page==4):
					get_parent().get_node("seguir").show()
				set_bbcode(dialogo[page])
				set_visible_characters(0)
		else:
			set_visible_characters(get_total_character_count())

func _on_Timer_timeout():
	set_visible_characters(get_visible_characters()+1)
	pass # Replace with function body.


func _on_balao_hide():
	get_parent().get_node("balao").hide()
	pass # Replace with function body.


func _on_seguir_pressed():
	audio_player.play_click()
	get_tree().change_scene("res://moduloPais/voceSabia/diretora/Quiz1/Quiz.tscn")
	
	pass # Replace with function body.

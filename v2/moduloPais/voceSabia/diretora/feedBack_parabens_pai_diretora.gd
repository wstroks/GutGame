extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var score=0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_seguir_pressed():
	audio_player.play_click()
	if(score==0):
		get_node("ParallaxBackground/ParallaxLayer/TextureRect").set_texture(load("res://img/voceSabia/pai_feedback_diretora2.png"))
		
	if(score==1):
		get_node("ParallaxBackground/ParallaxLayer/TextureRect").set_texture(load("res://img/voceSabia/pai_parabens_diretora.png"))
		get_node("seguir").set_normal_texture(load("res://img/botoes/seg_1.png"))
		get_node("seguir").set_hover_texture(load("res://img/botoes/seg_2.png"))
		get_node("seguir").set_pressed_texture(load("res://img/botoes/seg_2.png"))
		get_node("facebook").show()
		get_node("instagram").show()
		
	if(score==2):
		get_tree().change_scene("res://moduloPais/voceSabia/tela_vocesabia_pais.tscn")
	score+=1
	
	pass # Replace with function body.


func _on_facebook_pressed():
	audio_player.play_click()
	OS.shell_open("https://www.facebook.com/276322776392062/photos/a.298169474207392/344750709549268/?type=3&theater")
	pass # Replace with function body.


func _on_instagram_pressed():
	OS.shell_open("https://www.instagram.com/p/By738gJlkSG/")
	audio_player.play_click()
	pass # Replace with function body.

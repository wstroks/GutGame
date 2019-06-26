extends Node2D

var vector
var correctAnswer
var givenAnswer = 3
var pos
var win_scene = preload("res://screens/winScene/winScreen.tscn")
#Essas variáveis armazenam o valor "1" caso estejam pressionados e "0" caso não estejam pressionados
var button1_1 = 0
var button1_2 = 0
var button2_1 = 0
var button2_2 = 0

var question1 = preload("res://sprites/texts/gameQuestion.png")
var question2 = preload("res://sprites/texts/gameQuestion2.png")

var scenesTimes = [
[0, 8.944, 20.581312, 24.906647, 29.087978, 36.27198, 46.863979, 50.954647, 55.301311, 64.826645, 75.813309, 81.461311, 89.034645, 94.287979],
[0, 13.68, 21.6, 29.754667, 39.509335, 52.010666, 58.080002, 67.418663, 74.410667, 78.346649, 81.786644, 86.362648, 90.826645, 96.245316, 104.559982],
[0, 6.133333, 10.362667, 23.440001, 30.154667, 40.469334, 43.674667, 50.762665, 56.015999, 66.842667, 76.767998, 89.984001]]


func _ready():
#warning-ignore:return_value_discarded
	$optionsAnimation/close.set_block_signals(true)
	global_config.connect("musicChanged", self, "changeBackSound")
	if(global_config.easymode == 1):
		$ColorRect.set_visible(true)
		$ColorRect/ouvirTrecho.set_block_signals(false)
	else:
		$ColorRect.set_visible(false)
		$ColorRect/ouvirTrecho.set_block_signals(true)
	get_tree().set_auto_accept_quit(false)
	get_tree().set_quit_on_go_back(false)
	match(global_config.storychosen):
		1:
			$Popup/title.set_text("Os três porquinhos")
			$history.stream = load("res://sound/3porquinhos.ogg")
			vector = [preload("res://sprites/images/3Porquinhos/Parte1.jpg"), preload("res://sprites/images/3Porquinhos/Parte2.jpg"),
			preload("res://sprites/images/3Porquinhos/Parte3.jpg"), preload("res://sprites/images/3Porquinhos/Parte4.jpg"),
			preload("res://sprites/images/3Porquinhos/Parte5.jpg"), preload("res://sprites/images/3Porquinhos/Parte6.jpg"),
			preload("res://sprites/images/3Porquinhos/Parte7.jpg"), preload("res://sprites/images/3Porquinhos/Parte8.jpg"),
			preload("res://sprites/images/3Porquinhos/Parte9.jpg"), preload("res://sprites/images/3Porquinhos/Parte10.jpg"),
			preload("res://sprites/images/3Porquinhos/Parte11.jpg"), preload("res://sprites/images/3Porquinhos/Parte12.jpg"),
			preload("res://sprites/images/3Porquinhos/Parte13.jpg"), preload("res://sprites/images/3Porquinhos/Parte14.jpg")]
		2:
			$Popup/title.set_text("Chapeuzinho Vermelho")
			$history.stream = load("res://sound/ChapeuzinhoVermelho.ogg")
			vector = [preload("res://sprites/images/ChapeuzinhoVermelho/Parte1.jpg"), preload("res://sprites/images/ChapeuzinhoVermelho/Parte2.jpg"),
			preload("res://sprites/images/ChapeuzinhoVermelho/Parte3.jpg"), preload("res://sprites/images/ChapeuzinhoVermelho/Parte4.jpg"),
			preload("res://sprites/images/ChapeuzinhoVermelho/Parte5.jpg"), preload("res://sprites/images/ChapeuzinhoVermelho/Parte6.jpg"),
			preload("res://sprites/images/ChapeuzinhoVermelho/Parte7.jpg"), preload("res://sprites/images/ChapeuzinhoVermelho/Parte8.jpg"),
			preload("res://sprites/images/ChapeuzinhoVermelho/Parte9.jpg"), preload("res://sprites/images/ChapeuzinhoVermelho/Parte10.jpg"),
			preload("res://sprites/images/ChapeuzinhoVermelho/Parte11.jpg"), preload("res://sprites/images/ChapeuzinhoVermelho/Parte12.jpg"),
			preload("res://sprites/images/ChapeuzinhoVermelho/Parte13.jpg"), preload("res://sprites/images/ChapeuzinhoVermelho/Parte14.jpg"),
			preload("res://sprites/images/ChapeuzinhoVermelho/Parte15.jpg")]
		3:
			$Popup/title.set_text("A pequena Sereia")
			$history.stream = load("res://sound/PequenaSereia.ogg")
			vector = [preload("res://sprites/images/PequenaSereia/Parte1.jpg"), preload("res://sprites/images/PequenaSereia/Parte2.jpg"),
			preload("res://sprites/images/PequenaSereia/Parte3.jpg"), preload("res://sprites/images/PequenaSereia/Parte4.jpg"),
			preload("res://sprites/images/PequenaSereia/Parte5.jpg"), preload("res://sprites/images/PequenaSereia/Parte6.jpg"),
			preload("res://sprites/images/PequenaSereia/Parte7.jpg"), preload("res://sprites/images/PequenaSereia/Parte8.jpg"),
			preload("res://sprites/images/PequenaSereia/Parte9.jpg"), preload("res://sprites/images/PequenaSereia/Parte10.jpg"),
			preload("res://sprites/images/PequenaSereia/Parte11.jpg"), preload("res://sprites/images/PequenaSereia/Parte12.jpg")]
	_set_options()
	$text.set_texture(question1)
	if(global_config.played_once == 0):
		$ColorRect2.set_visible(true)
		$ColorRect2/Label.set_text("Olá, bem vindo(a)! Como é sua primeira vez aqui, vou te \n ensinar como tudo funciona.")
		$AnimationPlayer.play("tip2", -1, 1.0, false)
		yield(get_tree().create_timer(4), "timeout")
		if(global_config.easymode == 0):
			$ColorRect2/Label.set_text("Para dar zoom, dê um clique na polaroid. Vamos lá, tente!")
			$AnimationPlayer.play("tip", -1, 1.0, false)
			yield($AnimationPlayer, "animation_finished")
			$outerClick.set_visible(true)
			$innerClick.set_visible(true)
			$click.set_visible(true)
			$AnimationPlayer.play("zoomClick2", -1, 1.0, false)
		else:
			$ColorRect2/Label.set_text("Primeiro, clique em Ouvir Trecho, para ouvir o \n início da história")
			$AnimationPlayer.play("tip2", -1, 1.0, false)
			yield($AnimationPlayer, "animation_finished")


func changeBackSound():
	var position
	var isPlaying
	position = $history.get_playback_position()
	isPlaying = $history.is_playing()
	match(global_config.storychosen):
		1:
			if(global_config.music == true):
				$history.stream = load("res://sound/3porquinhos.ogg")
			else:
				$history.stream = load("res://sound/3porquinhos_01.ogg")
		2:
			if(global_config.music == true):
				$history.stream = load("res://sound/ChapeuzinhoVermelho.ogg")
			else:
				$history.stream = load("res://sound/ChapeuzinhoVermelho_01.ogg")
		3:
			if(global_config.music == true):
				$history.stream = load("res://sound/PequenaSereia.ogg")
			else:
				$history.stream = load("res://sound/PequenaSereia_01.ogg")
	if(isPlaying):
		$history.play(position)
		global_config.background_sound.stop()
	else:
		$history.seek(position)


#warning-ignore:unused_argument
func _process(delta):
	if(global_config.level < 13):
		if($history.get_playback_position()>=scenesTimes[global_config.storychosen-1][global_config.level+1]):
			if($history.is_playing()):
				$history.stop()
			if(global_config.music == true):
				global_config.background_sound.play()
			if(global_config.played_once == 0):
				$ColorRect2/Label.set_text("Para dar zoom, dê um clique na polaroid. Vamos lá, tente!")
				$AnimationPlayer.play("tip", -1, 1.0, false)
				yield($AnimationPlayer, "animation_finished")
				$outerClick.set_visible(true)
				$innerClick.set_visible(true)
				$click.set_visible(true)
				$AnimationPlayer.play("zoomClick2", -1, 1.0, false)
			set_process(false)


func next():
	if($history.is_playing()):
		$history.stop()
		if(global_config.music == true):
			global_config.background_sound.play()
	if(givenAnswer == correctAnswer):
		global_config.increment_level()
		if(global_config.level > 0):
			$text.set_texture(question2)
		else:
			$text.set_texture(question1)
		if(global_config.finish !=1):
			_set_options()
		else:
		#warning-ignore:return_value_discarded
			get_tree().change_scene_to(win_scene)
			global_config.played_once = 1
			global_config.save_game()
	else:
		if(givenAnswer == 0):
			get_node("/root/Node2D/optionsAnimation/AnimationPlayer").play_backwards("answer_Option1", -1)
			yield(get_node("/root/Node2D/optionsAnimation/AnimationPlayer"), "animation_finished")
		else:
			get_node("/root/Node2D/optionsAnimation/AnimationPlayer").play_backwards("answer_Option2", -1)
			yield(get_node("/root/Node2D/optionsAnimation/AnimationPlayer"), "animation_finished")
		#sugerir que a história seja ouvida novamente
		#Faz com que não seja possível clicar nos botões:
		$polaroid3/half1_1.set_block_signals(true)
		$polaroid3/half1_2.set_block_signals(true)
		$polaroid3_2/half2_1.set_block_signals(true)
		$polaroid3_2/half2_2.set_block_signals(true)
		$pause.set_block_signals(true)
		$wrongAnswer.set_visible(true)
		$wrongAnswer/opt1/ouvirAgain.set_block_signals(false)
		$wrongAnswer/opt2/keepPlaying.set_block_signals(false)
		get_node("/root/Node2D/wrongAnswer/AnimationPlayer").play("openUp", -1, 1.0, false)
		yield(get_node("/root/Node2D/wrongAnswer/AnimationPlayer"), "animation_finished")
	if(global_config.played_once == 0):
		$AnimationPlayer.stop()
		$click.set_visible(false)
		global_config.played_once=1
		global_config.save_game()
		$ColorRect2/Label.set_text("Agora você está pronto para continuar a brincar sozinho. \n Boa sorte!")
		yield(get_tree().create_timer(3), "timeout")
		$AnimationPlayer.play_backwards("tip", -1)
		yield($AnimationPlayer, "animation_finished")


func _set_options():
	#Storychosen = 1: 3 porquinhos - level 0 ao 13
	#Storychosen = 2: Chapeuzinho Vermelho - level 0 ao 14
	#Storychosen = 2: A pequena sereia - level 0 ao 11
	var valores_sorteio1 = [12,13,10]
	var valores_sorteio2 = [13,14,11]
	if(global_config.level<valores_sorteio1[global_config.storychosen-1]):
		# Sortear um número entre (level+2) e level max:
		pos = (randi()%(valores_sorteio2[global_config.storychosen-1]-(global_config.level+1))) + (global_config.level+1)
	else:
		pos = randi()%valores_sorteio1[global_config.storychosen-1]
	givenAnswer = 3
	if(global_config.played_once == 1):
		correctAnswer = randi()%100 + 1
		if(correctAnswer%2 == 0):
			correctAnswer = 1
		else:
			correctAnswer = 0
		match(correctAnswer):
			0: 
				$polaroid3/polaroid1.set_texture(vector[global_config.level])
				$polaroid3_2/polaroid1.set_texture(vector[pos])
			1:
				$polaroid3/polaroid1.set_texture(vector[pos])
				$polaroid3_2/polaroid1.set_texture(vector[global_config.level])
	else:
		correctAnswer = 1
		$polaroid3/polaroid1.set_texture(vector[pos])
		$polaroid3_2/polaroid1.set_texture(vector[global_config.level])


func _zoomScreenAnimation(var type):
	if(global_config.played_once == 0):
		$AnimationPlayer.stop()
		$outerClick.set_visible(false)
		$innerClick.set_visible(false)
		$click.set_visible(false)
		$ColorRect2/Label.set_text("Para fechar, clique no X acima")
	#Faz com que não seja possível clicar nos botões:
	$polaroid3/half1_1.set_block_signals(true)
	$polaroid3/half1_2.set_block_signals(true)
	$polaroid3_2/half2_1.set_block_signals(true)
	$polaroid3_2/half2_2.set_block_signals(true)
	$optionsAnimation/close.set_block_signals(false)
	if(type == 0):
		$optionsAnimation/TouchScreenButton.set_texture($polaroid3/polaroid1.get_texture())
		$optionsAnimation.set_visible(true)
		$polaroid3/polaroid1.set_shape_visible(false)
		get_node("/root/Node2D/optionsAnimation/AnimationPlayer").play("zoom_in_Option1", -1, 1.0, false)
		yield(get_node("/root/Node2D/optionsAnimation/AnimationPlayer"), "animation_finished")
		global_config.zoomPic = 0
	else:
		$optionsAnimation/TouchScreenButton.set_texture($polaroid3_2/polaroid1.get_texture())
		$optionsAnimation.set_visible(true)
		$polaroid3_2/polaroid1.set_shape_visible(false)
		get_node("/root/Node2D/optionsAnimation/AnimationPlayer").play("zoom_in_Option2", -1, 1.0, false)
		yield(get_node("/root/Node2D/optionsAnimation/AnimationPlayer"), "animation_finished")
		global_config.zoomPic = 1


func _on_half1_1_pressed():
	button1_1 = 1
	_verifyButtonsOption0()


func _on_half1_2_pressed():
	button1_2 = 1
	if(button1_1 != 1):
		_verifyButtonsOption0()


func _on_half2_1_pressed():
	button2_1 = 1
	_verifyButtonsOption1()


func _on_half2_2_pressed():
	button2_2 = 1
	if(button2_1 != 1):
		_verifyButtonsOption1()


func _verifyButtonsOption0():
	yield(get_tree().create_timer(0.2), "timeout")
	if(button1_1 == 1 and button1_2 == 1):
		$optionsAnimation/TouchScreenButton.set_texture($polaroid3/polaroid1.get_texture())
		$optionsAnimation.set_visible(true)
		$polaroid3/polaroid1.set_shape_visible(false)
		get_node("/root/Node2D/optionsAnimation/AnimationPlayer").play("answer_Option1", -1, 1.0, false)
		yield(get_node("/root/Node2D/optionsAnimation/AnimationPlayer"), "animation_finished")
		givenAnswer = 0
		next()
	else:
		$pauseScreen/close.set_block_signals(true)
		$pause.set_block_signals(true)
		$optionsAnimation/close.set_block_signals(false)
		_zoomScreenAnimation(0)
	button1_1 = 0
	button1_2 = 0


func _verifyButtonsOption1():
	yield(get_tree().create_timer(0.2), "timeout")
	if(button2_1 == 1 and button2_2 == 1):
		$optionsAnimation/TouchScreenButton.set_texture($polaroid3_2/polaroid1.get_texture())
		$optionsAnimation.set_visible(true)
		$polaroid3_2/polaroid1.set_shape_visible(false)
		get_node("/root/Node2D/optionsAnimation/AnimationPlayer").play("answer_Option2", -1, 1.0, false)
		yield(get_node("/root/Node2D/optionsAnimation/AnimationPlayer"), "animation_finished")
		givenAnswer = 1
		next()
	else:
		$pauseScreen/close.set_block_signals(true)
		$pause.set_block_signals(true)
		$optionsAnimation/close.set_block_signals(false)
		_zoomScreenAnimation(1)
	button2_1 = 0
	button2_2 = 0


func _on_pause_pressed():
	$pauseScreen/close.set_block_signals(false)
	$ColorRect.set_visible(false)
	$pauseScreen.set_visible(true)
	$ColorRect/ouvirTrecho.set_block_signals(true)
	$polaroid3/half1_1.set_block_signals(true)
	$polaroid3/half1_2.set_block_signals(true)
	$polaroid3_2/half2_1.set_block_signals(true)
	$polaroid3_2/half2_2.set_block_signals(true)
	$pause.set_block_signals(true)
	if($history.is_playing()):
		$history.stop()
	if(global_config.played_once == 0):
		$innerClick.set_visible(false)
		$outerClick.set_visible(false)
		$click.set_visible(false)
		$ColorRect2.set_visible(false)
	$pauseScreen/AnimationPlayer.play_backwards("Pausemenu", -1)
	yield(get_node("/root/Node2D/pauseScreen/AnimationPlayer"), "animation_finished")


func _on_ouvirTrecho_pressed():
	global_config.background_sound.stop()
	$history.play(scenesTimes[global_config.storychosen-1][global_config.level])
	set_process(true)
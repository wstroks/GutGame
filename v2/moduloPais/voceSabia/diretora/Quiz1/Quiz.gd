extends Control

export (NodePath) var questionTextPath
export (NodePath) var trueAnswerPath
export (NodePath) var falseAnswerPath
export (NodePath) var animatorPath
export (NodePath) var timerPath
export (NodePath) var questionHolderPath

onready var questionText=get_node(questionTextPath)
onready var trueAnswer=get_node(trueAnswerPath)
onready var falseAnswer=get_node(falseAnswerPath)
onready var animator=get_node(animatorPath)
onready var timer=get_node(timerPath)
onready var questionHolder=get_node(questionHolderPath)

var score=0
var answer=null

func _ready():
	randomize()
	set_question()
	pass

func set_question():
	var childAmount = questionHolder.get_child_count()
	var whichQuestion
	
	if childAmount >0:
		whichQuestion=questionHolder.get_child( randi()%childAmount)
		#print(whichQuestion.fact)
		questionText.set_text(whichQuestion.fact)
		answer=whichQuestion.answer
		get_node("feliz").hide()
		get_node("triste").hide()
		get_node("feliz2").hide()
		get_node("triste2").hide()
		get_node("fund_triste1").hide()
		get_node("fund_feliz1").hide()
		get_node("fund_triste").hide()
		get_node("fund_feliz").hide()
	else:
		get_node("buttonLayer/falseButton").hide()
		get_node("buttonLayer/falseButton2").hide()
		get_node("buttonLayer/trueButton").hide()
		get_node("buttonLayer/trueButton2").hide()
		get_node("answerLayer/falseAnswer").hide()
		get_node("answerLayer/trueAnswer").hide()
		get_node("feliz").hide()
		get_node("triste").hide()
		get_node("feliz2").hide()
		get_node("triste2").hide()
		get_node("fund_triste1").hide()
		get_node("fund_feliz1").hide()
		get_node("fund_triste").hide()
		get_node("fund_feliz").hide()
		get_node("ParallaxBackground/ParallaxLayer/TextureRect").set_texture(load("res://img/voceSabia/tela_score.png"))
		get_node("seguir").show()
		
		if(score==0):
			questionText.set_text("Você não acertou nenhuma das questões, mas não desanime. Vamos para o feedback para perceber qual informação você errou.")
		if(score==1):
			questionText.set_text("Você acertou apenas uma questão, Vamos agora pro feedback das questões?! Com isso irá perceber qual informação você errou, não desanime!")
		if(score==2 || score==3):
			questionText.set_text("Parabéns você acertou uma quantidade noa quantidade de questões, mas sempre é bom ter feedback das questões, então Vamos?!")
		if(score==4):
			questionText.set_text("Você acertou todas as questões, mas sempre é importante ter feedback das questões, então Vamos?!")
		#questionText.set_text("Você acertou uma quantidade de " + str(score) + ", Vamos agora pro feedback das questões?!")
	if whichQuestion!= null:
		questionHolder.remove_child(whichQuestion)


func _on_trueButton_pressed():
	if answer== true:
		score+=1
		get_node("answerLayer/trueAnswer").set_text("Você Acertou a resposta")
		
	else:
		get_node("answerLayer/trueAnswer").set_text("Você Errou a resposta")
		
		
	animator.play("trueSlide")
	timer.start()
	pass # Replace with function body.


func _on_falseButton_pressed():
	if answer== false:
		score+=1
		#print("false : errado")
		get_node("answerLayer/falseAnswer").set_text("Você Acertou a resposta")
		
	else:
		#print("false : correto")
		get_node("answerLayer/falseAnswer").set_text("Você Errou a resposta")
		
		
	animator.play("falseSlide")
	timer.start()
	pass # Replace with function body.


func _on_Timer_timeout():
	animator.play_backwards(animator.get_current_animation())
	set_question()
	
	pass # Replace with function body.


func _on_falseButton2_pressed():
	audio_player.play_click()
	if answer== false:
		score+=1
		#print("false : Certo")
		get_node("answerLayer/falseAnswer").set_text("Você Acertou a resposta")
		get_node("feliz2").show()
		get_node("fund_feliz1").show()
	else:
		#print("false : Errado")
		get_node("answerLayer/falseAnswer").set_text("Você Errou a resposta")
		get_node("triste2").show()
		get_node("fund_triste1").show()
		
		
		
	animator.play("falseSlide")
	timer.start()
	pass # Replace with function body.


func _on_trueButton2_pressed():
	audio_player.play_click()
	#print(answer)
	if answer== true:
		score+=1
		#print("True : Certo")
		get_node("answerLayer/trueAnswer").set_text("Você Acertou a resposta")
		get_node("feliz").show()
		get_node("fund_feliz").show()
	else:
		#print("True : errado")
		get_node("answerLayer/trueAnswer").set_text("Você Errou a resposta")
		get_node("triste").show()
		get_node("fund_triste").show()
		
	animator.play("trueSlide")
	timer.start()
	pass # Replace with function body.


func _on_seguir_pressed():
	audio_player.play_click()
	get_tree().change_scene("res://moduloPais/voceSabia/diretora/feedBack_parabens_pai_diretora.tscn")
	pass # Replace with function body.

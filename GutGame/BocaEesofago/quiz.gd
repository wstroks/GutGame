extends Control
export (NodePath) var questionTextPath
export (NodePath) var trueAnswerPath
export (NodePath) var falseAnswerPath
export (NodePath) var animatorPath
export (NodePath) var timerPath
export (NodePath) var questionHolderPath
var count=0
var numero=0
onready var questionText=get_node(questionTextPath)
onready var trueAnswer=get_node(trueAnswerPath)
onready var falseAnswer=get_node(falseAnswerPath)
onready var animator=get_node(animatorPath)
onready var timer=get_node(timerPath)
onready var questionHolder=get_node(questionHolderPath)

var score=0
var answer=null
var bloco=null

func _ready():
	randomize()
	set_question()
	pass

func set_question():
	
	print(randi(0,10)%10)
	var childAmount = questionHolder.get_child_count()
	var whichQuestion
	
	if childAmount >0:
		whichQuestion=questionHolder.get_child(randi(0,childAmount)%childAmount)
		questionText.set_text(whichQuestion.fact)
		var text= str(whichQuestion.resposta1)
		var text1= str(whichQuestion.resposta2)
		var text2= str(whichQuestion.resposta3)
		var text3= str(whichQuestion.resposta4)
		get_node("feliz_2").hide()
		get_node("feliz_1").hide()
		get_node("triste_1").hide()
		get_node("triste_2").hide()
		numero+=1
		get_node("ButtonLayer/trueButton/Label").set_text(text)
		get_node("ButtonLayer/falseButton1/Label").set_text(text1)
		get_node("ButtonLayer/trueButton1/Label1").set_text(text2)
		get_node("ButtonLayer/falseButton3/Label").set_text(text3)
		
		
		print("aqui" + str(answer) )
		answer=whichQuestion.answer
		bloco=whichQuestion.bloco
	else:
		questionText.set_text("Você acertou " + str(score) + ", Vamos agora pro feedback das questões?!")
		get_node("conquista").show()
		if(score>=(numero/2)):
			get_node("Label").set_text("Parabéns passou de fase, acertando uma quantidade de " + str(score)+" de "+ str(numero)+"  questões!! ")
			get_node("seguir").show()
		else:
			get_node("Label").set_text("Você não passou de fase, acertou apenas uma quantidade de " + str(score)+" de "+ str(numero)+"  questões!! Tente de novo!! ")
			get_node("menu").show()
			get_node("jogar_n").show()
		get_node("Label").show()
		get_node("respostasLayer/truerespostas").hide()
		get_node("respostasLayer/falserespostas1").hide()
		get_node("ButtonLayer/trueButton").hide()
		get_node("ButtonLayer/falseButton1").hide()
		get_node("ButtonLayer/trueButton1").hide()
		get_node("ButtonLayer/falseButton3").hide()
		
		get_node("Panel").show()
		
		
	if whichQuestion!= null:
		questionHolder.remove_child(whichQuestion)



func _on_falseButton1_released():
	if answer== false and bloco=="0":
		score+=1
		print("false : errado")
		get_node("respostasLayer/falserespostas1").set_text("Você Acertou a resposta")
		get_node("feliz_2").show()
	else:
		print("false : correto")
		get_node("respostasLayer/falserespostas1").set_text("Você Errou a resposta")
		get_node("triste_2").show()
		
	animator.play("falseSlide")
	timer.start()
func _on_trueButton_released():
	if answer== true and bloco=="0":
		score+=1
		get_node("respostasLayer/truerespostas").set_text("Você Acertou a resposta")
		get_node("feliz_1").show()
	else:
		get_node("respostasLayer/truerespostas").set_text("Você Errou a resposta")
		get_node("triste_1").show()
		
	animator.play("trueSlide")
	timer.start()


func _on_timer_timeout():
	animator.play_backwards(animator.get_current_animation())
	set_question()
	



func _on_trueButton1_pressed():
	if answer== true and bloco=="1":
		score+=1
		get_node("respostasLayer/truerespostas").set_text("Você Acertou a resposta")
		get_node("feliz_1").show()
	else:
		get_node("respostasLayer/truerespostas").set_text("Você Errou a resposta")
		get_node("triste_1").show()
		
	animator.play("trueSlide")
	timer.start()
	pass # replace with function body


func _on_falseButton3_pressed():
	if answer== false and bloco=="1":
		score+=1
		print("false : errado")
		get_node("respostasLayer/falserespostas1").set_text("Você Acertou a resposta")
		get_node("feliz_2").show()
	else:
		print("false : correto")
		get_node("respostasLayer/falserespostas1").set_text("Você Errou a resposta")
		get_node("triste_2").show()
		
	animator.play("falseSlide")
	timer.start()
	pass # replace with function body


func _on_seguir_pressed():
	audio_player.play("Click")
	

	get_tree().change_scene("res://Estomago/apresenta.tscn")
	pass # replace with function body


func _on_jogar_n_pressed():
	audio_player.play("Click")
	get_tree().change_scene("res://BocaEesofago/quiz.tscn")
	
	pass # replace with function body


func _on_menu_pressed():
	audio_player.play("Click")
	get_tree().change_scene("res://main.tscn")
	pass # replace with function body

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
var bloco=""

func _ready():
	randomize()
	set_question()
	pass

func set_question():
	var childAmount = questionHolder.get_child_count()
	var whichQuestion
	
	if childAmount >0:
		whichQuestion=questionHolder.get_child( randi()%childAmount)
		print(whichQuestion.fact)
		questionText.set_text(whichQuestion.fact)
		answer=whichQuestion.answer
		var text= str(whichQuestion.resposta1)
		var text1= str(whichQuestion.resposta2)
		var text3= str(whichQuestion.resposta3)
		var text4= str(whichQuestion.resposta4)
		bloco=str(whichQuestion.bloco)
		
		get_node("feliz").hide()
		get_node("triste").hide()
		get_node("feliz2").hide()
		get_node("triste2").hide()
		
		print(text)
		get_node("buttonLayer/trueButton2/Label").set_text(text)
		get_node("buttonLayer/falseButton2/Label").set_text(text1)
		
		get_node("buttonLayer/trueButton3/Label").set_text(text3)
		get_node("buttonLayer/falseButton3/Label").set_text(text4)
	else:
		questionText.set_text("Você acertou " + str(score) + ", Vamos agora pro feedback das questões?!")
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
		print("false : errado")
		get_node("answerLayer/falseAnswer").set_text("Você Acertou a resposta")
		
	else:
		print("false : correto")
		get_node("answerLayer/falseAnswer").set_text("Você Errou a resposta")
		
		
	animator.play("falseSlide")
	timer.start()
	pass # Replace with function body.


func _on_Timer_timeout():
	animator.play_backwards(animator.get_current_animation())
	set_question()
	get_node("feliz").hide()
	get_node("triste").hide()
	get_node("feliz2").hide()
	get_node("triste2").hide()
	pass # Replace with function body.


func _on_falseButton2_pressed():
	if answer== false && bloco=="0":
		score+=1
		print("false : Certo")
		get_node("answerLayer/falseAnswer").set_text("Você Acertou a resposta")
		get_node("feliz2").show()
		
	else:
		print("false : Errado")
		get_node("answerLayer/falseAnswer").set_text("Você Errou a resposta")
		get_node("triste2").show()
		
		
		
		
	animator.play("falseSlide")
	timer.start()
	pass # Replace with function body.


func _on_trueButton2_pressed():
	print(answer)
	if answer== true && bloco=="0":
		score+=1
		print("True : Certo")
		get_node("answerLayer/trueAnswer").set_text("Você Acertou a resposta")
		get_node("feliz").show()
		
	else:
		print("True : errado")
		get_node("answerLayer/trueAnswer").set_text("Você Errou a resposta")
		get_node("triste").show()
		
		
	animator.play("trueSlide")
	timer.start()
	pass # Replace with function body.


func _on_trueButton3_pressed():
	if answer== true && bloco=="1":
		score+=1
		print("True : Certo")
		get_node("answerLayer/trueAnswer").set_text("Você Acertou a resposta")
		get_node("feliz").show()
		
	else:
		print("True : errado")
		get_node("answerLayer/trueAnswer").set_text("Você Errou a resposta")
		get_node("triste").show()
		
		
	animator.play("trueSlide")
	timer.start()
	
	pass # Replace with function body.


func _on_falseButton3_pressed():
	if answer== false && bloco=="1":
		score+=1
		print("false : Certo")
		get_node("answerLayer/falseAnswer").set_text("Você Acertou a resposta")
		get_node("feliz2").show()
		
	else:
		print("false : Errado")
		get_node("answerLayer/falseAnswer").set_text("Você Errou a resposta")
		get_node("triste2").show()
		
		
		
		
	animator.play("falseSlide")
	timer.start()
	pass # Replace with function body.

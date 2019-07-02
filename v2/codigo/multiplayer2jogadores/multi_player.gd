extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var seta1=""
var seta2=""
var score1=0
var score2=0
var caminho1="res://codigo/multiplayer2jogadores/01/Boca/Quiz.tscn"
var caminho2="res://codigo/multiplayer2jogadores/01/Figado/Quiz.tscn"
var vez="Jogador 1"
var tabuleiro1=0
var tabuleiro2=0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _vezesta():
	return vez
func vez(uu):
	vez=uu
func _playerondevai1():
	return caminho1
func _playervai1(caminho3):
	caminho1=caminho3

func _playerondevai2():
	return caminho2
func _playervai2(caminho):
	caminho2=caminho
func _infoplayer2():
	return seta2
func _infoplayer1():
	return seta1
func _scoreplayer2():
	return score2
func _scoreplayer1():
	return score1
	

func _player1(x,u):
	seta1=x
	score1=u
	
func _player2(r,t):
	seta2=r
	score2=t
func tabuleiro1(numero1):
	tabuleiro1=numero1
func tabuleiro2(numero2):
	tabuleiro2=numero2
	
func tabuleiro1infor():
	return tabuleiro1
	
func tabuleiro2infor():
	return tabuleiro2

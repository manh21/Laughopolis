extends CanvasLayer

@onready var HealthBar = $TopLeft/HealthBar
@onready var Score =  $TopRight/Score/Score/nilai
@onready var HealthPotion = $TopLeft/HealthPotion
@onready var root = $"."
@export var healthbar = 0
@export var potion = 3

signal PlayerDie
signal SaveScore

var spritis = []
	
func AddHealthBar(value):
	HealthBar.value += value
func SubtractHealthBar(value):
	HealthBar.value -= value
	if (HealthBar.value < 1 and HealthPotion.get_child_count() == 0):
		$Control/Gameover/AnimationPlayer.play('popup')
		get_parent().get_tree().paused = true
		PlayerDie.emit()
		
func ResetHealthBar():
	HealthBar.step = healthbar
	HealthBar.value = 100
	
func AddScore(value):
	Score.text = str(int(Score.text) + value)
	
func SubtractScore(value):
	Score.text = str(int(Score.text) - value)
func ResetScore():
	Score.text = str(0)
func setScore(value):
	print('ini scorfe')
	Score.text = str(value)
func AddPotion():
	var potion = preload("res://Scripts/UI/HealthPotionComponent.tscn").instantiate()
	potion.position = Vector2(30 * HealthPotion.get_child_count(),70)
	HealthPotion.add_child(potion)
	
func DeletePotion():
	if (HealthPotion.get_child_count() != 0):
		HealthPotion.get_child(-1).queue_free()
	
	
	
# Called when the node enters the scene tree for the first time.
func _ready():
	ResetHealthBar()
	for i in range(potion):
		AddPotion()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if (HealthBar.value < 1 and HealthPotion.get_child_count() == 0):
		#$Control/Gameover/AnimationPlayer.play('popup')
		#get_tree().paused = true
		
	#setScore(Global.globalpoin)
	#if Input.is_action_just_pressed('ui_select'):
		#var quiz = preload("res://Scripts/Components/QuizComponent.tscn").instantiate()
		#print(quiz.tes)
		#root.add_child(quiz)
		#get_tree().paused = true
		#if Input.is_action_just_pressed("down"):
			#get_tree().paused = false
	pass

func _on_player_score():
	SubtractHealthBar(20)
	if (HealthBar.value < 1 and HealthPotion.get_child_count() != 0):
		DeletePotion()
		ResetHealthBar()
	pass # Replace with function body.

#setting button
func _on_texture_button_pressed():
	$BottomRight/setting/AnimationPlayer.play('kecil')
	$BottomLeft/info/AnimationPlayer.play('kecil')
	$Control/Panel/AnimationPlayer.play('tes')
	#get_tree().paused = true
	#$info.visible = false
	pass # Replace with function body.

func _on_restart_pressed():
	SaveScore.emit()
	get_tree().reload_current_scene()
	ResetHealthBar()
	ResetScore()
	pass # Replace with function body.

func _on_exit_pressed():
	get_tree().quit()
	pass # Replace with function body.

func _on_resume_pressed():
	$Control/Panel/AnimationPlayer.play('tes2')
	$BottomRight/setting/AnimationPlayer.play('kecil2')
	$BottomLeft/info/AnimationPlayer.play('kecil2')
	pass # Replace with function body.

func _on_info_pressed():
	$Control/Guide/AnimationPlayer.play('popup')
	$BottomRight/setting/AnimationPlayer.play('kecil')
	$BottomLeft/info/AnimationPlayer.play('kecil')
	pass # Replace with function body.

func _on_resumeinfo_pressed():
	$Control/Guide/AnimationPlayer.play('back')
	$BottomRight/setting/AnimationPlayer.play('kecil2')
	$BottomLeft/info/AnimationPlayer.play('kecil2')
	pass # Replace with function body.

func _on_timer_timeout():
	get_parent().get_tree().paused = true

extends Node2D

var spirits = []
var score := 0
var player_potions = 0
var best_score = 0

func _ready():
	var spirit = get_tree().get_nodes_in_group("spirits")
	for i in spirit:
		i.connect("Die", add_score)
		
	#Load High Score
	best_score = $Utilites/SaveScore.load_score()
	$HUD/GameOver/Control/NinePatchRect/BestPlayerScoreLabel.text = "Best Score: " + str(best_score)
		
	new_game()

func _on_pintu_end_game():
	get_parent().get_tree().paused = true
	$UI.show()
	$HUD/GameOver/AudioStreamPlayer2D.play()
	$HUD/GameOver.show()
	$HUD/GameOver/Control/NinePatchRect/Button.pressed.connect(new_game)
	
func new_game():
	get_parent().get_tree().paused = false
	get_tree().call_group("bullets", "queue_free")
	$UI.ResetHealthBar()
	$UI.ResetScore()
	$HUD/GameOver.hide()
	$UI.show()
	
func restart():
	get_tree().reload_current_scene()
		
func add_score():
	score += 1
	set_best_score()
	$UI.AddScore(1)
	
func set_best_score():
	$HUD/GameOver/Control/NinePatchRect/PlayerScoreLabel.text = "Your Score: " + str(score)
	
	if best_score < score:
		$Utilites/SaveScore.save_score(score)
		$HUD/GameOver/Control/NinePatchRect/BestPlayerScoreLabel.text = "Best Score: " + str(score)

func _on_game_over_restart_game():
	restart()

func _on_ui_player_die():
	set_best_score()

func _on_ui_save_score():
	set_best_score()

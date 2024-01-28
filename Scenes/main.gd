extends Node2D

func _ready():
	new_game()

func _on_pintu_end_game():
	get_parent().get_tree().paused = true
	$HUD/GameOver.show()
	$HUD/GameOver/Control/NinePatchRect/Button.pressed.connect(new_game)
	
func new_game():
	get_parent().get_tree().paused = false
	get_tree().call_group("bullets", "queue_free")
	$HUD/GameOver.hide()

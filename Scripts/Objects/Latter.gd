extends StaticBody2D
	
func _on_hitbox_component_body_entered(body):
	if body.name == "Player":
		$LetterDialouge.start()

func _on_hitbox_component_body_exited(body):
	$LetterDialouge.exit()

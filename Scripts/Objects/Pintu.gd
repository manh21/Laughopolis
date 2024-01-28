extends Area2D

signal EndGame

func _on_body_entered(body):
	if body.name == "Player":
		EndGame.emit()

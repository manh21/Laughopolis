extends CanvasLayer

signal RestartGame

func _on_button_button_down():
	RestartGame.emit()

extends Area2D

func _input(event):
	if event.is_action_pressed("ui_accept") and len(get_overlapping_bodies()) < 0:
		use_dialouge()
		
func use_dialouge():
	pass

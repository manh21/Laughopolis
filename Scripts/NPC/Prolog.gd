extends Area2D
class_name Prolog

@onready var bubble_text := $BubbleText

@export var is_completed: bool = false

func _ready():
	set_bubble()

func _on_area_2d_area_entered(area):
	pass
	
func set_bubble(bubbleComplete = is_completed):
	bubble_text.completed(bubbleComplete)

func _on_body_entered(body):
	$Dialouge.start()

func _on_body_exited(body):
	$Dialouge.exit()

extends CharacterBody2D
class_name Monk

@onready var bubble_text := $BubbleText

@export var is_completed: bool = false

func _ready():
	set_bubble()

func _on_area_2d_area_entered(area):
	print(area.name)
	
func set_bubble(bubbleComplete = is_completed):
	bubble_text.completed(bubbleComplete)

func _on_area_2d_body_entered(body):
	$Dialouge.start()
	set_bubble(true)

func _on_area_2d_body_exited(body):
	$Dialouge.exit()
	
	if $Dialouge.is_dialouge_completed:
		set_bubble(true)
	else:
		set_bubble(false)

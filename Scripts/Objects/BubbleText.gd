extends StaticBody2D

@export var is_completed: bool = false

@onready var animation_tree = $AnimationTree
@onready var state_machine = animation_tree.get("parameters/playback")

# Called when the node enters the scene tree for the first time.
func _ready():
	change_state()

func completed(is_complete):
	is_completed = is_complete
	change_state()
	
func change_state():
	if is_completed:
		state_machine.travel("complete")
	else:
		state_machine.travel("dialog_buble")

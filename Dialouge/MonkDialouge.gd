extends CanvasLayer

@export var d_File: JSON

var dialouge = []
var current_dialouge_id = 0
var is_active: bool = false
var is_dialouge_completed: bool = false

func _ready():
	$NinePatchRect.visible = false
	
func start():
	if is_active:
		return
	
	is_active = true
	$NinePatchRect.visible = true
		
	dialouge = d_File.data
	next_script()
	
func exit():
		is_active = false
		$NinePatchRect.visible = false
		current_dialouge_id -= 1
		return
	
func load_dialouge():
	var json = JSON.new()
	var dialouges = d_File.data
	return dialouges
	
func _input(event):
	if is_active == false:
		return
	if event.is_action_pressed("ui_accept"):
		next_script()
		
func next_script():
	if(current_dialouge_id >= len(dialouge)):
		$Timer.start()
		$NinePatchRect.visible = false
		return
	
	$NinePatchRect/Name.text = dialouge[current_dialouge_id]['name'];
	$NinePatchRect/Chat.text = dialouge[current_dialouge_id]['text']
	current_dialouge_id += 1


func _on_timer_timeout():
	is_active = false
	is_dialouge_completed = true
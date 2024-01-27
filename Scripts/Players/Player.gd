extends CharacterBody2D

@export var move_speed : float = 100
@export var starting_direction : Vector2 = Vector2(0, 1)

@onready var animation_tree = $AnimationTree
@onready var state_machine = animation_tree.get("parameters/playback")
@onready var shot_timer = $ShotTimer

signal Shoot

var attacking: bool = false
var can_shoot: bool = false

func _ready():
	add_to_group("Player")
	update_animation_parameters(starting_direction)
	can_shoot = true

func _physics_process(delta):
	var input_direction = Input.get_vector("left", "right", "up", "down")
	input_direction = input_direction.normalized()
	
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and can_shoot:
		shoot()
		
	update_animation_parameters(input_direction)
	
	velocity = input_direction * move_speed
	
	move_and_collide(input_direction * move_speed * delta)
	pick_new_state()	

func shoot():
	var shoot_direction = get_global_mouse_position() - position;
	
	Shoot.emit(position, shoot_direction)
	can_shoot = false
	shot_timer.start()

func update_animation_parameters(move_input: Vector2):
	if(move_input != Vector2.ZERO):
		animation_tree.set("parameters/idle/blend_position", move_input)
		animation_tree.set("parameters/walk/blend_position", move_input)

func pick_new_state():
	if(velocity != Vector2.ZERO):
		state_machine.travel("walk")
	else:
		state_machine.travel("idle")

func _on_hitbox_component_area_entered(area):
	if area.has_meta("damage"):
		print(area)

func _on_hitbox_component_body_entered(body):
	pass

func _on_shot_timer_timeout():
	can_shoot = true

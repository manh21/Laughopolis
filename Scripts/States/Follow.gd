extends State
class_name Follow

@export var enemy: CharacterBody2D
@export var move_speed := 20.0
var player: CharacterBody2D

signal Attack

func Enter():
	player = get_tree().get_first_node_in_group("Player")

func Physics_Update(delta: float):
	var direction = player.global_position - enemy.global_position
	
	if direction.length() > 10:
		enemy.velocity = direction.normalized() * move_speed
	else:
		enemy.velocity = Vector2()
		Attack.emit()		
		
	if direction.length() > 80:
		Transitioned.emit(self, "Idle")

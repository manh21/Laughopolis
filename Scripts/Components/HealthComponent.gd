extends Node2D
class_name HealthComponent

@export var MAX_HEALTH := 10.0
var health: float

func _ready():
	health = MAX_HEALTH
	
func damage(attack: Attack):
	health -= attack.attack_damage
	
	if health <= 0 and get_tree().get_first_node_in_group("Player") != null:
		print("Player Dead")
	else:
		get_parent().queue_free()

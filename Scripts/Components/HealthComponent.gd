extends Node2D
class_name HealthComponent

@export var MAX_HEALTH := 10.0
var health: float

signal Die
signal serang

func _ready():
	health = MAX_HEALTH
	
func damage(attack: Attack):
	health -= attack.attack_damage
	serang.emit()
	if health <= 0:
		Die.emit(health)

extends CharacterBody2D
class_name SpiritEnemy

@export var MAX_HEALTH := 20.0
var health
var taking_damage := false
var current_stun_time := 0.0

func _ready():
	health = MAX_HEALTH

func _physics_process(_delta): 
	move_and_slide()
	
func damage(attack: Attack):
	health -= attack.attack_damage
	
	if health <= 0:
		queue_free()
		
	taking_damage = true
	current_stun_time = attack.stun_time
	velocity = (global_position - attack.attack_position).normalized() * attack.knockback_force

func _on_hitbox_component_body_entered(body):
	print(body)
	
	if body.has_method("damage"): 
		var attack = Attack.new()
		attack.attack_damage = 10.0
		attack.knockback_force = 100.0
		attack.attack_position = global_position
		
		body.damage(attack)


func _on_hitbox_component_area_entered(area):
	print(area)
	if area is HitboxComponent:
		var attack = Attack.new()
		attack.attack_damage = 10.0
		attack.knockback_force = 100.0
		attack.attack_position = global_position
		
		area.damage(attack)

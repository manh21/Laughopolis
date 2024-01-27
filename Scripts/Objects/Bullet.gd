extends Area2D

@export var explosion_scene: PackedScene
@export var speed: float = 200
var direction: Vector2

func _physics_process(delta):
	position += speed * direction * delta
	rotation = atan2(direction.y, direction.x)
	
func _on_timer_timeout():
	queue_free()
	pass

func _on_area_entered(area):
	if area is HitboxComponent:
		var attack = Attack.new()
		attack.attack_damage = 10.0
		attack.knockback_force = 100.0
		attack.attack_position = global_position
		
		area.damage(attack)
		explode()

func explode():
	speed = 0
	var explosion = explosion_scene.instantiate()
	add_child(explosion)
	explosion.position = global_position - position
	explosion.add_to_group("explosions")
	
	$Sprite2D.set_deferred("visible", false)
	$CollisionShape2D.set_deferred("visible", false)


func _on_body_entered(body):
	pass
	#print(body)
	#
	#if body.has_method("damage"): 
		#var attack = Attack.new()
		#attack.attack_damage = 10.0
		#attack.knockback_force = 100.0
		#attack.attack_position = global_position
		#
		#body.damage(attack)

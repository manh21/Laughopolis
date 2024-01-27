extends Area2D

@export var speed: float = 100
var direction: Vector2

func _process(delta):
	#print(direction)
	position += speed * direction * delta
	
func _on_timer_timeout():
	queue_free()

func _on_body_entered(body):
	if body.name == "Object":
		queue_free()

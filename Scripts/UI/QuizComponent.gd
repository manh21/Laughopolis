extends Control
@onready var answer = $answer
@export var tes = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	#answer.get_children()[0].grab_focus()
	#print(tes)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	
func generateQuiz():
	print('quizz')

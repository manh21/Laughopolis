extends Node
class_name SaveScore

func save_score(score):
	var file = FileAccess.open("user://high-score.txt",FileAccess.WRITE)
	file.store_string("%s" % score)
	

func load_score():
	var file = FileAccess.open("user://high-score.txt", FileAccess.READ)
	if file:
		var score = file.get_as_text(true).to_int()
		return score
	else:
		return 0

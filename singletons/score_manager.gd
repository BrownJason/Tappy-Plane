extends Node

var _score: int = 0
var _high_score: int = 0
var save_path = "user://savescore.save"

func get_score() -> int:
	return _score
	
func get_high_score() -> int:
	return _high_score
	
func set_score(v: int) -> void:
	_score = v
	if _score > _high_score:
		_high_score = _score
	
	SignalManager.on_score_updated.emit()
	
func add_score() -> void:
	set_score(_score + 1)

func save_score():
	var save_score = FileAccess.open(save_path, FileAccess.WRITE)
	save_score.store_var(_high_score)
	
func load_score():
	if FileAccess.file_exists(save_path):
		print("file found")
		var file = FileAccess.open(save_path, FileAccess.READ)
		_high_score = file.get_var()
	else:
		print("file not found")
		_high_score = 0

func _ready():
	load_score()

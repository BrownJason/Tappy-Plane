extends Control

@onready var h_score = $MarginContainer/HScore
@onready var audio_stream_player = $AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	h_score.text = str(ScoreManager.get_high_score())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event.is_action_pressed("fly"):
		if event.is_pressed():
			GameManager.load_game_scene()


func _on_button_pressed():
	ScoreManager.save_score()
	get_tree().quit()

func _on_press_to_play_pressed():
	GameManager.load_game_scene()

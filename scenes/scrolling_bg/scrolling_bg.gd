extends ParallaxBackground


# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.on_plane_death.connect(on_plane_death)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	scroll_offset.x -= GameManager.SCROLL_SPEED * delta

func on_plane_death():
	set_process(false)

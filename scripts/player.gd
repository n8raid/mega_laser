extends Node2D
@export var MOVE_SPEED = 250



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var joy1_x = Input.get_axis("move_left", "move_right")
	print(joy1_x)
	if joy1_x == 0:
		pass
	if joy1_x < 0:
		MOVE_SPEED = 200
	if joy1_x > 0:
		MOVE_SPEED = 375
	position.x += MOVE_SPEED * delta * joy1_x

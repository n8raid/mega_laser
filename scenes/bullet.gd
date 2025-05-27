extends Area2D
signal bullet_hit

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	hide() #bullet should disappear on hit
	bullet_hit.emit()
	# copied from dodge the creeps, should prevent multiple hit signals
	$CollisionShape2D.set_deferred("disabled", true)

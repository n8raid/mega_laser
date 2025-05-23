extends Node2D

@export var enemy_spawn_perc_chance: float = 0.1

const enemy_scene = preload("res://scenes/enemy.tscn")
var enemy_num = 0

## Signals
signal spawned_enemy

var rng = RandomNumberGenerator.new()

func _ready():
	$SpawnTimer.start()
	spawn_enemy()

func _process(d: float):
	pass

func _on_spawn_timer_timeout() -> void:
	var spawn_chance = rng.randf_range(0.0, 1.0)
	if spawn_chance > 1.0 - enemy_spawn_perc_chance:
		spawn_enemy()
	else:
		print('no spawn triggered')

func spawn_enemy():
	enemy_num += 1
	var enemy = Enemy.new_enemy('Plane %s' % enemy_num)
	add_child(enemy)
	emit_signal("spawned_enemy")

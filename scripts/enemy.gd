class_name Enemy
extends Node2D

## Exports
@export var MOVE_SPEED = 100

enum EnemyType {PLANE}

## Signals
signal destroyed
signal escaped

## Member vars
var enemy_type: EnemyType
var enemy_type_str: String

func llog(msg: String) -> void:
	print('[Enemy-%s-%s] %s' % [name, enemy_type_str, msg])

func _process(delta: float) -> void:
	position.x += MOVE_SPEED * delta

static func new_enemy(name: String) -> Enemy:
	var new_enemy: Enemy = preload("res://scenes/enemy.tscn").instantiate()
	new_enemy.name = name
	new_enemy.enemy_type = EnemyType.PLANE
	new_enemy.enemy_type_str = EnemyType.keys()[new_enemy.enemy_type]
	print('[Enemy-%s-%s] %s' % [name, new_enemy.enemy_type_str, 'Im alive!'])
	return new_enemy
	


func _on_enemy_on_screen_notifier_screen_exited() -> void:
	print('freeing me: %s' % name)
	queue_free()

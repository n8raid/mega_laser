extends Node2D


@export var move_speed_up = 0
@export var gun_damage_up = 0
@export var gun_speed_up = 0
@export var gun_spread_up = 0


var MOVE_SPEED = 287.5 + (move_speed_up * 25)
var GUN_DAMAGE = 1 + (gun_damage_up)
var GUN_SPEED = 0.3 - (gun_speed_up * 0.05)
var GUN_SPREAD = 1 + (gun_spread_up)






# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$GunTimer.wait_time = GUN_SPEED
	$GunTimer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	
	## Movement, faster to right than left
	var joy1_x = Input.get_axis("move_left", "move_right")
	if joy1_x == 0:
		pass
	if joy1_x < 0:
		MOVE_SPEED = 200
	if joy1_x > 0:
		MOVE_SPEED = 325
	position.x += MOVE_SPEED * delta * joy1_x


	## Gun controls (rotation)
	var joy2 = Input.get_vector("shoot_left", "shoot_right", "shoot_up","shoot_down")
	if joy2.length() > 0.1:
		if joy2.y >= 0: # cancels movement under the y-axis
			joy2.y = 0
			
		var joy2_rad = atan2(joy2.y,joy2.x)
		var joy2_rad_center = joy2_rad + (PI/2)
		$Gun.rotation = joy2_rad_center
		
	
		
		

	## Gun firing
func _on_gun_timer_timeout() -> void:
	var joy2 = Input.get_vector("shoot_left", "shoot_right", "shoot_up","shoot_down")
	if joy2.length() > 0.1:
		if joy2.y >= 0: # cancels movement under the y-axis
			joy2.y = 0
	if joy2.length() > 0.1:
		print(GUN_DAMAGE)
		print(GUN_SPREAD)
		print(GUN_SPEED)
		print(MOVE_SPEED)
		shoot()
	# GunTimer speed update
	$GunTimer.wait_time = GUN_SPEED
		

## Bullet logic - will implement later
func shoot() -> void: 
	pass

extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D
@onready var gun = $Gun
@onready var gun_sfx = $Gun/GunSfx
@onready var plauer_area = $PlayerArea
@export var gravity = 400
@export var speed = 125
@export var jump_force = 250

func _physics_process(delta):
	if Input.is_action_just_pressed("shoot"):
		gun.play("fire")
		gun_sfx.play()
	if is_on_floor() == false:
		velocity.y += gravity*delta
		if velocity.y > 500:
			velocity.y = 500
	if Input.is_action_just_pressed("up") && is_on_floor():
		velocity.y  = -jump_force
	if Input.is_action_just_pressed("down") && !is_on_floor():
		velocity.y  = +jump_force
	var direction = Input.get_axis("left","right")
	if direction != 0:
		animated_sprite.flip_h = (direction == -1)
	velocity.x = direction * speed
	move_and_slide()
	update_animations(direction)
	Global.player_position = plauer_area.global_position

func update_animations(direction):
	if direction == 0:
		animated_sprite.play("idle")
	else:
		animated_sprite.play("run")
	
	#if is_on_floor():
		#if direction == 0:
			#animated_sprite.play("idle")
		#else:
			#animated_sprite.play("run")
	#else:
		#if direction != 0:
			#animated_sprite.play("run")





func _on_player_area_area_entered(area):
	$".".queue_free()

extends AnimatedSprite2D


var bullet = preload("res://Scenes/bullet.tscn")
func _process(delta):
	look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("shoot"):
		var dir = get_global_mouse_position() - self.global_position
		var bullet_instance = bullet.instantiate()
		get_tree().get_root().add_child(bullet_instance)
		bullet_instance.position = self.global_position
		bullet_instance.rotation_degrees = rotation_degrees
		bullet_instance.direction = dir.normalized()
		
	

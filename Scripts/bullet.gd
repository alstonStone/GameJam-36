extends Area2D


var speed : int = 100
var direction : Vector2


func _process(delta):
	position += speed * direction * delta


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()



func _on_area_entered(area):
	print(area.name)

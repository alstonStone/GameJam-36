extends Area2D

var speed : int = 2



func _process(delta):
	var dir = Global.player_position - self.global_position
	position += speed * dir * delta
	
	
func _on_area_entered(area):
	area.queue_free()
	queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited():
	self.queue_free()

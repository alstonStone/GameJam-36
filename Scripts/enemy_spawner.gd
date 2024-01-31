extends Node2D

var ghost_scene = preload("res://Scenes/enemy.tscn")
@onready var spawn_positions = $SpawnPostitions

func _on_timer_timeout():
	spawn_enemy()


func spawn_enemy():
	var spawn_positions_array = spawn_positions.get_children()
	var random_spawn_position = spawn_positions_array.pick_random()
	var enemy_instance = ghost_scene.instantiate()
	enemy_instance.global_position = random_spawn_position.global_position
	add_child(enemy_instance)

class_name SceneManager extends Node

var player: Player

func change_scene(from, to_new_scene: String) -> void:
	player = from.player
	player.get_parent().remove_child(player)
	from.get_tree().call_deferred("change_scene_to_file", to_new_scene)	

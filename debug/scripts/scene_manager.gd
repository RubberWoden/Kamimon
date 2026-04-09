class_name SceneManager extends Node


func change_scene(body, from, to_new_scene: String) -> void:
	var player = body
	player.get_parent().remove_child(player)
	from.get_tree().call_deferred("change_scene_to_file", to_new_scene)	
	get_parent().add_child(player)

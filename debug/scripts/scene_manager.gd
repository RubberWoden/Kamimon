class_name SceneManager extends Node


func change_scene(body, from, to_new_scene: String) -> void:
	var player = body
	
	from.get_tree().call_deferred("change_scene_to_file", to_new_scene)	
	var new_scene = ResourceUID.text_to_id(to_new_scene)
	player.reparent(new_scene)

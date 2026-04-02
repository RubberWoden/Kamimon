extends CharacterBody2D

@export var SPEED : float = 100.0
@onready var anim: AnimatedSprite2D = $AnimatedSprite2D

var last_direction: Vector2 = Vector2.RIGHT

func _physics_process(_delta: float) -> void:
	#process input to move
	process_movement()
	#process the animations to move
	process_animation()
	#move the player
	move_and_slide()
	
#get player input
func process_movement() -> void:
	#this seemed like the best choice to get all input directions
	var direction := Input.get_vector("left", "right", "up", "down")
	
	#find direction then move that direction via speed, don't do drugs kids
	if direction != Vector2.ZERO:
		velocity = direction * SPEED
		last_direction = direction
	else:
		velocity = Vector2.ZERO

#processing the animation correctly
#always check spelling errors in your sprite frames
func process_animation() -> void:
	if velocity != Vector2.ZERO:
		play_animation("walk", last_direction)
	else: 
		play_animation("idle", last_direction)

#the animations need to be processed here
func play_animation(prefix: String, dir: Vector2) -> void:
	#sides
	if dir.x != 0:
		#flip for left
		anim.flip_h = dir.x < 0
		anim.play(prefix + "side")
	#up aka seeing the back of the sprite
	elif dir.y < 0:
		anim.play(prefix + "back")
	#down aka seeing the front of the sprite
	elif dir.y > 0:
		anim.play(prefix + "front")#there was an error in sprites frames fixed "font" to "front"
	

extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity") 

var dir = Vector2.LEFT

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	if dir == Vector2.LEFT and is_on_wall():
		dir = Vector2.RIGHT
	elif dir == Vector2.RIGHT and is_on_wall():
		dir = Vector2.LEFT
	
	velocity.x = dir.x * SPEED
	
	move_and_slide()

extends CharacterBody2D


const MAX_SPEED = 400.0
const ACCEL = 2500
const FRICTION = 1200

var movement = Vector2.ZERO

func get_input():
	movement.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	movement.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	return movement.normalized()

func _physics_process(delta):
	move(delta)
	
func move(delta):
	movement = get_input()
	
	if movement == Vector2.ZERO:
		if velocity.length() > (FRICTION * delta):
			velocity -= velocity.normalized() * (FRICTION * delta)
		else:
			velocity = Vector2.ZERO
	else:
		velocity += (movement * ACCEL * delta)
		velocity = velocity.limit_length(MAX_SPEED)
	move_and_slide()

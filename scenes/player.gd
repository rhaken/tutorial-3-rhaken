extends CharacterBody2D

@export var walk_speed = 200
@export var gravity = 200.0
@export var jump_speed = -300
@export var max_jump = 2
@export var jump_count = 0


func _physics_process(delta):
	velocity.y += delta * gravity

	if is_on_floor():
		jump_count = 0
	if Input.is_action_just_pressed("ui_up") and jump_count <= max_jump:
		if jump_count == 0 and is_on_floor():
			velocity.y = jump_speed
			jump_count += 1
		elif jump_count == 1:
			velocity.y = jump_speed
			jump_count += 1
		print(jump_count)
	if Input.is_action_pressed("ui_left"):
		velocity.x = -walk_speed
	elif Input.is_action_pressed("ui_right"):
		velocity.x = walk_speed
	else:
		velocity.x = 0
	# "move_and_slide" already takes delta time into account.
	move_and_slide()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass  # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

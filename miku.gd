extends CharacterBody2D


@export var walk_speed = 200
@export var gravity = 500.0
@export var jump_speed = -300
@export var max_jump = 2
@export var jump_count = 0
@export var dash_speed = 500
@export var dash_duration = 0.2
@export var crouch_speed = 100
var dash_time = 0.0
var dash_direction = 0

var last_input = ""
var last_input_time = 0.0
var double_tap_time = 0.3
var is_dashing = false
var is_jumping = false


func _physics_process(delta):
	velocity.y += delta * gravity
	
	if Input.is_action_pressed("ui_down") and is_on_floor():
		$AnimatedSprite2D.play("Crouching")
		if Input.is_action_pressed("ui_left"):
			velocity.x = -crouch_speed
			$AnimatedSprite2D.flip_h = false
		elif Input.is_action_pressed("ui_right"):
			velocity.x = crouch_speed
			$AnimatedSprite2D.flip_h = true
		else:
			velocity.x = 0
		move_and_slide()
		return
		
	
	if is_dashing:
		$AnimatedSprite2D.play("Dash")
		dash_time -= delta
		if dash_time <= 0:
			is_dashing = false
		else:
			velocity.x = dash_direction * dash_speed
			move_and_slide()
			return
	
	
	elif Input.is_action_just_pressed("ui_left") or Input.is_action_just_pressed("ui_right"):
		var current_input = "ui_left" if Input.is_action_just_pressed("ui_left") else "ui_right"
		var direction = -1 if current_input == "ui_left" else 1
		if last_input == current_input and (Time.get_ticks_msec() - last_input_time) < double_tap_time * 1000:
			is_dashing = true
			dash_time = dash_duration
			dash_direction = direction
			velocity.x = direction * dash_speed
			return
		else:
			velocity.x = direction * walk_speed
		last_input = current_input
		last_input_time = Time.get_ticks_msec()
	
	if is_on_floor():
		jump_count = 0
		is_jumping = false
	if  Input.is_action_just_pressed('ui_up') and jump_count <= max_jump:
		is_jumping = true
		if jump_count == 0 and is_on_floor():
			$AnimatedSprite2D.play("Jump")
			velocity.y = jump_speed
			jump_count += 1
		elif jump_count == 1:
			$AnimatedSprite2D.play("Jump")
			velocity.y = jump_speed
			jump_count += 1
		print(jump_count)
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -walk_speed
		$AnimatedSprite2D.flip_h = true
		if not is_jumping:
			$AnimatedSprite2D.play("Run")
	elif Input.is_action_pressed("ui_right"):
		velocity.x =  walk_speed
		$AnimatedSprite2D.flip_h = false
		if not is_jumping:
			$AnimatedSprite2D.play("Run")
	else:
		if(is_on_floor()):
			$AnimatedSprite2D.play("Idle")
		velocity.x = 0
	# "move_and_slide" already takes delta time into account.
	move_and_slide()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

extends KinematicBody2D


export var move_speed = 124.0 
export var gravity = 500.0
var velocity = Vector2()
export var jump_force = 240.0

func _ready():
	pass 


func _physics_process(delta):
	var move_dir = 0
	
	if Input.is_action_pressed("move_right"):
		move_dir += 1
	if Input.is_action_pressed("move_left"):
		move_dir -= 1
	
	
	if is_on_floor():	
		velocity.y = 0.0
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_force
	
	velocity.y += gravity * delta
	velocity.x = move_dir * move_speed
	move_and_slide(velocity, Vector2.UP)

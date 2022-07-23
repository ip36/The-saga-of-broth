extends KinematicBody2D

export (int) var speed = 200
onready var sprite = $AnimatedSprite
var velocity = Vector2()
var kooldownmax = 0.1
var kooldowncurrent = 0
var facingdirection

func get_input():
	velocity = Vector2()
	if kooldowncurrent <= 0:
		if Input.is_action_pressed("ui_right"):
			velocity.x += 32
			kooldowncurrent = kooldownmax
			sprite.frame = 3
			facingdirection = 3
		if Input.is_action_pressed("ui_left"):
			velocity.x -= 32
			kooldowncurrent = kooldownmax
			sprite.frame = 2
			facingdirection = 2
		if Input.is_action_pressed("ui_down"):
			velocity.y += 32
			kooldowncurrent = kooldownmax
			sprite.frame = 0
			facingdirection = 0
		if Input.is_action_pressed("ui_up"):
			velocity.y -= 32
			kooldowncurrent = kooldownmax
			sprite.frame = 1
			facingdirection = 1

func _physics_process(delta):
	get_input()
	position.x += velocity.x 
	position.y += velocity.y
	kooldowncurrent -= delta


func _on_Area2D_body_entered(body):
	print("Hit enemy")

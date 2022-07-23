extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var swinging = false
onready var playerfacing = get_parent().get("facingdirection")
onready var sprite = $AnimatedSprite2
var kooldownmax = 0.75
var kooldown = 0
var endtimermax = 0.5
var endtimer = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	playerfacing = get_parent().get("facingdirection")
	if kooldown > 0:
		kooldown -= delta
	if endtimer > 0:
		endtimer -= delta
		if endtimer <= 0:
			position = Vector2(40, 36)
			swinging = false
			sprite.visible = false

func _input(event):
	if event is InputEventMouseButton and event.pressed == true and event.button_index == 1 and kooldown <= 0:
		if playerfacing == 3:
			sprite.visible = true
			kooldown = kooldownmax
			endtimer = endtimermax
			swinging = true
			sprite.frame = 0
			position.x += 45
		if playerfacing == 2:
			sprite.visible = true
			kooldown = kooldownmax
			endtimer = endtimermax
			swinging = true
			sprite.frame = 1
			position.x -= 45
		if playerfacing == 1:
			sprite.visible = true
			kooldown = kooldownmax
			endtimer = endtimermax
			swinging = true
			sprite.frame = 3
			position.y -= 45
		if playerfacing == 0:
			sprite.visible = true
			kooldown = kooldownmax
			endtimer = endtimermax
			swinging = true
			sprite.frame = 2
			position.y += 45

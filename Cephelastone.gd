extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var rng = RandomNumberGenerator.new()
var kooldownmax = 1
var kooldowncurrent = 0
var movementdiection
var velocity = Vector2()
onready var sprite = $Sprite
onready var projectile = load("res://Projectile.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity = Vector2()
	movementdiection = rng.randi_range(1, 4)
	if kooldowncurrent <= 0:
		if movementdiection == 1:
			velocity.x += 32
			kooldowncurrent = kooldownmax
			sprite.frame = 2
		elif movementdiection == 2:
			velocity.x -= 32
			kooldowncurrent = kooldownmax
			sprite.frame = 3
		elif movementdiection == 3:
			velocity.y += 32
			kooldowncurrent = kooldownmax
			sprite.frame = 0
		else:
			velocity.y -= 32
			kooldowncurrent = kooldownmax
			sprite.frame = 1
		var newprojectile = projectile.instance()
		newprojectile.set_direction(sprite.frame)
		add_child(newprojectile)
	position.x += velocity.x*3
	position.y += velocity.y*3
	kooldowncurrent -= delta

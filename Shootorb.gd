extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var csdirection


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = true
	print(csdirection)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_direction(direction):
	csdirection = direction

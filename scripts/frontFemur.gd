extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func walk(walkingPercentage):
	set_rot(walkingPercentage)
	get_child(0).walk(walkingPercentage)
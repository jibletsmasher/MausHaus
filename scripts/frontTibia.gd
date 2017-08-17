extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	pass

func walk(walkingPercentage):
	set_rot(walkingPercentage/2)
	#get_child(0).walk(walkingPercentage)

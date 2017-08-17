extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	pass
	
func walk(walkingMoment):
	set_rot(walkingMoment)
	get_child(0).walk(walkingMoment)

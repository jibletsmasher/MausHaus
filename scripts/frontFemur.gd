extends Sprite

# Femur is the top part of the back leg

# The minimum number of radians the mouse's leg can rotate during a walking phase
var walkingRotationMin = PI/8

# The maximum number of radians the mouse's femur can rotate during a walking phase
var walkingRotationMax = PI/3

# The range of rotation
var walkingRotationRange = 0.0

func _ready():
	# Called every time the node is added to the scene.
	walkingRotationRange = walkingRotationMax - walkingRotationMin

func walk(walkingPercentage):
	var rotation = _get_rotation(walkingPercentage)
	set_rot(rotation)
	get_child(0).walk(walkingPercentage)

func _get_rotation(walkingPercentage):
	var partPercentage
	if walkingPercentage < 0.51:
		partPercentage = walkingPercentage
	else:
		partPercentage = 1 - walkingPercentage
	return walkingRotationMin + walkingRotationRange*partPercentage
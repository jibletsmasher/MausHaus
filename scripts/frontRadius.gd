extends Sprite

# Radius is the lower part of the front leg

# The minimum number of radians the mouse's leg can rotate during a walking phase
var walkingRotationMin = PI/6

# The maximum number of radians the mouse's femur can rotate during a walking phase
var walkingRotationMax = PI/2

# The range of rotation
var walkingRotationRange = 0.0

func _ready():
	# Called every time the node is added to the scene.
	walkingRotationRange = walkingRotationMax - walkingRotationMin

func walk(walkingPercentage, numWalkingMoments):
	var rotation = _get_rotation(walkingPercentage, numWalkingMoments)
	set_rot(rotation)

func _get_rotation(walkingPercentage, numWalkingMoments):
	var partPercentage
	if walkingPercentage < 0.51:
		partPercentage = walkingPercentage
	else:
		partPercentage = 1 - walkingPercentage
	var inverseWalkingPercentage = 1 - partPercentage
	return walkingRotationMin + walkingRotationRange*inverseWalkingPercentage
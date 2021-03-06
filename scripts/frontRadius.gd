extends Sprite

# Radius is the lower part of the front leg

# The minimum number of radians the mouse's leg can rotate during a walking phase
var walkingRotationMin = PI/6

# The maximum number of radians the mouse's femur can rotate during a walking phase
var walkingRotationMax = PI

# The range of rotation
var walkingRotationRange = 0.0

# The percentage that the specific part is in the walking process.
# This accounts for scenarios when the part should move more quickly
# during certain portion of the walking cycle.
var partPercentage = 0.0

func _ready():
	# Called every time the node is added to the scene.
	walkingRotationRange = walkingRotationMax - walkingRotationMin

func walk(walkingPercentage, numWalkingMoments):
	var rotation = _get_rotation(walkingPercentage, numWalkingMoments)
	set_rot(rotation)

func _get_rotation(walkingPercentage, numWalkingMoments):
	if walkingPercentage == 0.0:
		partPercentage = 0.0
	elif walkingPercentage < 0.25 or (walkingPercentage > 0.5 and walkingPercentage < 0.75):
		partPercentage = partPercentage + 1.5/numWalkingMoments
	else:
		partPercentage = partPercentage + 0.5/numWalkingMoments
	
	var rotation
	if partPercentage > 1.0:
		partPercentage = 0.0
		rotation = walkingRotationMin
	elif partPercentage > 0.5:
		rotation = walkingRotationMin + walkingRotationRange*(1 - partPercentage)
	else:
		rotation = walkingRotationMin + walkingRotationRange*partPercentage
	
	return rotation
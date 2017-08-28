extends Sprite

# Tibia is the lower part of the back leg

# The minimum number of radians the mouse's leg can rotate during a walking phase
var walkingRotationMin = -PI/1.5

# The maximum number of radians the mouse's femur can rotate during a walking phase
var walkingRotationMax = -0.5

# The range of rotation
var walkingRotationRange = 0.0

# The percentage that the specific part is in the walking process.
# This accounts for scenarios when the part should move more quickly
# during certain portion of the walking cycle.
var partPercentage

# The percentage of the walking phase we want to start this part at.
# This is only used for the back body parts.
var startingPercentage = 0.5

func _ready():
	# Called every time the node is added to the scene.
	walkingRotationRange = walkingRotationMax - walkingRotationMin
	partPercentage = startingPercentage

func walk(walkingPercentage, numWalkingMoments):
	var rotation = _get_rotation(walkingPercentage, numWalkingMoments)
	set_rot(rotation)

func _get_rotation(walkingPercentage, numWalkingMoments):
	if walkingPercentage == 0.0:
		partPercentage = startingPercentage
	elif (walkingPercentage < 0.15) or (walkingPercentage > 0.4 and walkingPercentage < 0.65) or (walkingPercentage > 0.9):
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
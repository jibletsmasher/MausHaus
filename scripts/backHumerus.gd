extends Sprite

# Humerus is the top part of the front leg

# The minimum number of radians the mouse's leg can rotate during a walking phase
var walkingRotationMin = -PI/4

# The maximum number of radians the mouse's femur can rotate during a walking phase
var walkingRotationMax = PI/3

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
	get_child(0).walk(walkingPercentage, numWalkingMoments)

# Calculates the increment in rotation and returns the rotation we want to use
# for the image.  The elif blocks contain the faster movement portions of the walk
# while the else blocks contain the slower movement portions of the walk.
# Anytime we want to speed up the movement, we have to set aside an equal portion
# of time that we'll slow down the movement and vice versa.
func _get_rotation(walkingPercentage, numWalkingMoments):
#	if walkingPercentage == 0.0:
#		partPercentage = 0.0
	if (walkingPercentage > 0.25 and walkingPercentage < 0.5) or walkingPercentage > 0.75:
		partPercentage = partPercentage + 1.5/numWalkingMoments
	else:
		partPercentage = partPercentage + 0.5/numWalkingMoments
	
	var rotation
	if partPercentage > 1:
		partPercentage = 0.0
		rotation = walkingRotationMin
	elif partPercentage > 0.5:
		rotation = walkingRotationMin + walkingRotationRange*(1 - partPercentage)
	else:
		rotation = walkingRotationMin + walkingRotationRange*partPercentage
	
	return rotation
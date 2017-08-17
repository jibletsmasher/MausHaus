extends Sprite

# The minimum number of radians the mouse's leg can rotate during a walking phase
var walkingRotationMin = PI/6

# The maximum number of radians the mouse's femur can rotate during a walking phase
var walkingRotationMax = PI/2

# The range of rotation
var walkingRotationRange = 0.0

func _ready():
	# Called every time the node is added to the scene.
	walkingRotationRange = walkingRotationMax - walkingRotationMin

func walk(walkingPercentage):
	# For the radius, we want most of the rotation to happen when walkingPercentage is 0 - .25 and .75 - 1.
	var inverseWalkingPercentage = 1 - walkingPercentage
	var rotation = walkingRotationMin + walkingRotationRange*inverseWalkingPercentage
	set_rot(rotation)

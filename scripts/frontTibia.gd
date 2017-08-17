extends Sprite

# The minimum number of radians the mouse's leg can rotate during a walking phase
var walkingRotationMin = -PI/1.5

# The maximum number of radians the mouse's femur can rotate during a walking phase
var walkingRotationMax = -0.5

# The range of rotation
var walkingRotationRange = 0.0

func _ready():
	# Called every time the node is added to the scene.
	walkingRotationRange = walkingRotationMax - walkingRotationMin

func walk(walkingPercentage):
	var rotation = walkingRotationMin + walkingRotationRange*walkingPercentage
	set_rot(rotation)

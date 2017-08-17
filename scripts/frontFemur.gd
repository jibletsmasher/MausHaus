extends Sprite

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
	var rotation = walkingRotationMin + walkingRotationRange*walkingPercentage
	set_rot(rotation)
	get_child(0).walk(walkingPercentage)
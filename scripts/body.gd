extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

# True if walking, false otherwise
var walking = true

# Potential ideas for how to handle this:
#	1. Range from -PI/2 to PI/2 and allow each bodyPart's walk method to modify that value it is given for the appropriate rotation.
#	2. I like idea 1.
#	While debugging, I let the program run for a while and noticed the leg wasn't being completely rotated back, so there is
#	a positive cumulative rotation happening as we oscillate between the lower and upper bound.
#	Because of this we should use a number that, when subtracted or added, becomes equal to our bounds.
#	Float that ranges from -PI to PI
var walkingMoment = 0.0

# 1 if we should be incrementing walkingMoment, -1 if we should be decrementing walkingMoment
var walkingIncrementSign = 1

func _ready():
	set_process(true)
	
func _process(delta):
	if walking:
		if (walkingMoment > PI/2):
			walkingIncrementSign = -1
		elif (walkingMoment < -PI/2):
			walkingIncrementSign = 1
			
		var deltaIncrement = delta*walkingIncrementSign
		walkingMoment = walkingMoment + deltaIncrement
		for i in range(0, get_child_count()):
			var bodyPart = get_child(i)
			bodyPart.walk(walkingMoment)
		

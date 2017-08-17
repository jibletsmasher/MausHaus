extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

# True if walking, false otherwise
var walking = true

#	While debugging, I let the program run for a while and noticed the leg wasn't being completely rotated back, so there is
#	a positive cumulative rotation happening as we oscillate between the lower and upper bound.
#	Because of this we should use a number that, when subtracted or added, becomes equal to our bounds.
#	Float that ranges from 0 to PI
var walkingMoment = 0.0

var maxWalkingMoment = PI
var minWalkingMoment = 0

# 1 if we should be incrementing walkingMoment, -1 if we should be decrementing walkingMoment
var walkingIncrementSign = 1

func _ready():
	set_process(true)
	
func _process(delta):
	if walking:
		if (walkingMoment > maxWalkingMoment):
			walkingIncrementSign = -1
		elif (walkingMoment < minWalkingMoment):
			walkingIncrementSign = 1
		
		# We want to use a power of 2 because this should ensure we don't have computer rounding errors that would cause
		# a cumulative positive or negative sum as we oscillate between the upper and lower bounds.
		# The only numbers a computer is able to represent with perfect precision are powers of 2.
		var deltaIncrement = pow(2, -6)*walkingIncrementSign
		walkingMoment = walkingMoment + deltaIncrement
		var walkingPercentage = walkingMoment/maxWalkingMoment
		for i in range(0, get_child_count()):
			var bodyPart = get_child(i)
			bodyPart.walk(walkingPercentage)
		

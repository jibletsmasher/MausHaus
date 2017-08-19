extends Sprite

# True if walking, false otherwise
var walking = true

#	While debugging, I let the program run for a while and noticed the leg wasn't being completely rotated back, so there is
#	a positive cumulative rotation happening as we oscillate between the lower and upper bound.
#	Because of this we should use a number that, when subtracted or added, becomes equal to our bounds.
#	Float that encapsulates a whole walking motion range
var walkingMoment = 0.0

		# We want to use a power of 2 because this should ensure we don't have computer rounding errors that would cause
		# a cumulative positive or negative sum as we oscillate between the upper and lower bounds.
		# The only numbers a computer is able to represent with perfect precision are powers of 2.
var walkingMomentIncrement = pow(2, -2)

var walkingMomentMax = 50.0
var walkingMomentMin = 0.0

# The number of walking moments (i.e. the number of walking iterations in a full walking movement)
var numWalkingMoments

func _ready():
	set_process(true)
	numWalkingMoments = walkingMomentMax/walkingMomentIncrement
	
func _process(delta):
	if walking:
		var walkingPercentage = walkingMoment/walkingMomentMax
		for i in range(0, get_child_count()):
			var bodyPart = get_child(i)
			bodyPart.walk(walkingPercentage, numWalkingMoments)
		
		walkingMoment = walkingMoment + walkingMomentIncrement
		if (walkingMoment > walkingMomentMax):
			# A full rotation has occurred, so reset the walkingMoment
			walkingMoment = walkingMomentMin
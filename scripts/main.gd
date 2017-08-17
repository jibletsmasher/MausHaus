extends Node2D

# class member variables go here, for example:
# var a = 2
var enemySpeed = 300
var directions = Array()
var enemyStartIndex = 1

func _ready():
	set_process(true)
	for i in range(enemyStartIndex, get_child_count() + 1):
		directions.push_back(Vector2(0, 0))
	

func _process(delta):
	# AI/Enemy handling
	var playerPos = get_child(0).get_pos()
	var enemy
	var enemyPos
	var potentialDirection
	var distanceToPlayer
	var xUnitVector
	var yUnitVector
#	for i in range(enemyStartIndex, get_child_count()):
#		enemy = get_child(i)
#		enemyPos = enemy.get_pos()
#		potentialDirection = playerPos - enemyPos
#		distanceToPlayer = potentialDirection.length()
#		#if distanceToPlayer > 20:
#		directions[i] = potentialDirection
#		
#		# Create x and y unit vector so enemies have uniform speed regardless of their distance from the player
#		xUnitVector = (directions[i].x/distanceToPlayer)
#		yUnitVector = (directions[i].y/distanceToPlayer)
#		enemy.set_pos(Vector2(enemyPos.x + xUnitVector*delta*enemySpeed, enemyPos.y + yUnitVector*delta*enemySpeed))
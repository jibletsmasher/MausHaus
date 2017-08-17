extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
#not used: var velocity = 1 # The velocity is a measure of how far away from the character the user clicks
var direction = Vector2(0, 0)
var speed = 1.5

func _ready():
	set_process(true)
	set_process_input(true)
	set_pos(Vector2(get_viewport().get_rect().size.width/2, get_viewport().get_rect().size.height/2))

func _process(delta):
	
	# Player position handling
	# See http://jwbales.us/precal/part6/part6.4.html for vector math
	var horizontalMovement = direction.x*delta*speed
	var verticalMovement = direction.y*delta*speed
	var curPos = get_pos()
	
	if (curPos.x > get_viewport().get_rect().size.width):
		curPos.x = 0
	if (curPos.x < 0):
		curPos.x = get_viewport().get_rect().size.width
	if (curPos.y > get_viewport().get_rect().size.height):
		curPos.y = 0
	if (curPos.y < 0):
		curPos.y = get_viewport().get_rect().size.height
	
	set_pos(Vector2(curPos.x + horizontalMovement, curPos.y + verticalMovement))
	
func _input(event):
	if (event.type == InputEvent.MOUSE_BUTTON and event.button_index == BUTTON_LEFT and event.pressed):
		var curPos = get_pos()
		direction = event.pos - curPos
		#velocity = direction.length()
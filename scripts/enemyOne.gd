extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	set_pos(Vector2(get_viewport().get_rect().size.width - 10, get_viewport().get_rect().size.height - 10))

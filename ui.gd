extends CanvasLayer

onready var hud = get_node("Label")
onready var player = get_parent().get_node("Player")

func _process(delta):
	hud.text = var2str(player.distance)
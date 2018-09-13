extends StaticBody2D

var hasSpawned = false

func _process(delta):
	var wallL = get_node("Wall5")
	var wallR = get_node("Wall4")
	var Rstartpos = wallR.global_position
	var Lstartpos = wallL.global_position
	var playerPos = get_parent().get_node("Player").global_position
	var player = get_parent().get_node("Player")
	var spawner = get_node("Spawner")
	var spawnPos = spawner.global_position
	var platform = load("res://Platform.tscn")
	var platformInst = platform.instance()
	var timer = get_node("Timer")
	
	wallR.global_position = Vector2(Rstartpos.x,playerPos.y)
	wallL.global_position = Vector2(Lstartpos.x,playerPos.y)
	spawner.global_position = Vector2(spawnPos.x,spawnPos.y)

	randomize()
	var randInt = rand_range(-150,700)
	
	if player.linear_velocity.y > 400 and !hasSpawned:
		hasSpawned = true
		platformInst.set_name(var2str(player.distance))
		platformInst.global_position = Vector2(randInt,playerPos.y+1150)
		spawner.get_parent().get_parent().add_child(platformInst)
	
func _on_Timer_timeout():
	hasSpawned = false

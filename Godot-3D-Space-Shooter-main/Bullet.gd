extends KinematicBody

var velo = Vector3()
var playerBullet = true;
var KillParticles = load("res://KillParticles.tscn")
onready var main = get_tree().current_scene
onready var explodeSound = $EnemyExplode

func _physics_process(delta):
	move_and_slide(velo)

func _on_Area_body_entered(body):
	if body.is_in_group("Enemies") and playerBullet == true:
		var particles = KillParticles.instance()
		main.add_child(particles)
		particles.transform.origin = transform.origin
		body.queue_free()
		explodeSound.play()
		visible = false
		$Area/CollisionShape.disabled = true
		#countKills += 1
		#print(countKills)
	elif body.is_in_group("Player") and playerBullet == false:
		var particles = KillParticles.instance()
		main.add_child(particles)
		particles.transform.origin = transform.origin
		print("Player hit")
		explodeSound.play()
		visible = false
		$Area/CollisionShape.disabled = true

func _on_LightTimer_timeout():
	$OmniLight.visible = false

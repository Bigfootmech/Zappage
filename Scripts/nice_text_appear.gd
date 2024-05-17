extends Label

func _ready():
	var tween = create_tween()
	
	#tween.tween_property(self, "Color", Color.WHITE, 5)
	#tween.tween_property(self, "modulate", Color.RED, 1)
	#tween.tween_property(self, "scale", Vector2(), 1)
	tween.tween_property(self, "position", Vector2(20,-20), 1)
	
	tween.tween_callback(self.queue_free)
	
	pass # Replace with function body.

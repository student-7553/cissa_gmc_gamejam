extends Node3D


func triggerSFX():
	if Input.is_action_pressed("TEMP_SfxTrigger"):
		if not $AudioStreamPlayer3D_OpenStack.is_playing():
			$AudioStreamPlayer3D_OpenStack.play();

  /// @description The basics

// Check keys for movement

moveRight = keyboard_check(vk_right);
moveLeft = keyboard_check(vk_left);
moveDown = keyboard_check(vk_down);
moveUp = keyboard_check(vk_up);

// Calculate movement

VX = ((moveRight - moveLeft) * walkSpeed);
VY = ((moveDown - moveUp) * walkSpeed);

// If idle
if (VX == 0 && VY == 0) {
	// Change idle sprite based on last direction
	switch dir {
		case 0: sprite_index = ariel_idle_right; break;
		case 1: sprite_index = ariel_idle_up; break;
		case 2: sprite_index = ariel_idle_left; break;
		case 3: sprite_index = ariel_idle_down; break;
		
	}
	
}

// If moving
if (VX != 0 || VY != 0) {
	if !collision_point(x+VX, y, obj_par_environment, true, true) {
	x += VX;
	}
	if !collision_point(x, y+VY, obj_par_environment, true, true) {
	y += VY;
	}
}

// Change walking sprite based on direction
	// right
	if (VX > 0) {
		sprite_index = ariel_walk_right;
		dir = 0;
	}
	// left
	if (VX < 0) {
		sprite_index = ariel_walk_left;
		dir = 2;
	}
	// down
	if (VY > 0) {
		sprite_index = ariel_walk_down;
		dir = 3;
	}
	// up
	if (VY < 0) {
		sprite_index = ariel_walk_up;
		dir = 1;
	}
	
	

// Check for collisions with NPCs
nearbyNPC = collision_rectangle(x-lookRange, y-lookRange, x+lookRange, y+lookRange, Obj_par_NPC, false, true);
if nearbyNPC {
	// do something
	show_debug_message("obj_player has found an NPC!");
	
}
if !nearbyNPC {
	// do something else
	show_debug_message("obj_player can't see shit!");
	
}

// Depth sorting

depth = -y;
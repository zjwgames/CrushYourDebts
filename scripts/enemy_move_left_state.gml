///enemy_move_left_state
hspd = -spd;


var wall_at_left = place_meeting(x-1, y, oSolid);
var ledge_at_left = !position_meeting(bbox_left-1, bbox_bottom+1, oSolid);

var wall_at_right = place_meeting(x+1, y, oSolid);
var ledge_at_right = !position_meeting(bbox_right+1, bbox_bottom+1, oSolid);

var on_ground = place_meeting(x, y+1, oSolid);

if !on_ground {
    vspd += grav;
} else {
    vspd = 0;
}

if (wall_at_left || ledge_at_left) {
    state = enemy_move_right_state;
}

if ((wall_at_left || ledge_at_left) and (wall_at_right || ledge_at_right)) {
    state = enemy_idle_state; //idle state
}

// Control the enemy sprite
image_xscale = -1;

// Move the enemy
move(oSolid);

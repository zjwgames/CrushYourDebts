/// enemy_idle_state
hspd = 0;
image_speed = 0.025;

var dist = abs(sprite_width/2); //how far the enemy sees

var on_ground = place_meeting(x, y+1, oSolid);

var wall_at_left = place_meeting(x-dist, y, oSolid);
var ledge_at_left = !position_meeting(bbox_left-dist, bbox_bottom+1, oSolid);

var wall_at_right = place_meeting(x+dist, y, oSolid);
var ledge_at_right = !position_meeting(bbox_right+dist, bbox_bottom+1, oSolid);

if !on_ground {
    vspd += grav;
} else {
    vspd = 0;
}

//Face the player
if (oPlayer.x <= self.x) {
    image_xscale = -1;
}
if (oPlayer.x >= self.x) {
    image_xscale = 1;
}

// Go back into moving state if a walkable block is neighbouring
if !((wall_at_left || ledge_at_left) and (wall_at_right || ledge_at_right)) {
    if (wall_at_left || ledge_at_left) {
        image_speed = 0.1;
        state = enemy_move_right_state;
    }
    
    if (wall_at_right || ledge_at_right) {
        image_speed = 0.1;
        state = enemy_move_left_state;
    }
}

// Move the enemy
move(oSolid);

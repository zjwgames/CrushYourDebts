/// stomp_state

//If about to hit ground
if (place_meeting(x, y+vspd+1, oSolid) && vspd > 0) {
    //Play the landing sound
    //audio_emitter_pitch(audio_em, random_range(.8, 1.2));
    //audio_emitter_gain(audio_em, .2);
    //audio_play_sound_on(audio_em, snd_step, false, 6);
    
    // Create some dust
    repeat (irandom_range(vspd, 2*vspd)) {
        // Create within an area
        var rand_x = irandom_range(-8*(vspd/10), 8*(vspd/10));
        var rand_y = irandom_range(-4*(vspd/10), 4*(vspd/10));
        dust = instance_create(x+rand_x, y+rand_y+(sprite_height/2), oDust);
        var dust_spd = vspd/3;
        with (dust) {
            speed = dust_spd;
        }
    }
    
    var player_vspd = vspd;
    
    // Make blocks fall
    
    oCamera.shake = 30;  
    
    block_below_left = instance_position(x - oPlayer.sprite_width/2 + 1, y+vspd+1, oSolid);
    block_below_right = instance_position(x + oPlayer.sprite_width/2 - 1, y+vspd+1, oSolid);
    block_below = instance_position(x, y+vspd+1, oSolid);;
    if (instance_exists(block_below_left)) {//and (distance_to_point(block_below_left.x, block_below_left.y) < sprite_width)) {
        var left_x = block_below_left.x;
        var left_y = block_below_left.y;
        instance_destroy(block_below_left);
        falling_wall_left = instance_create(left_x, left_y, oFallingWall);
        with (falling_wall_left) {
            vspd = player_vspd;
        }
    }
    if (instance_exists(block_below_right)) {// and (distance_to_point(block_below_right.x, block_below_right.y) < sprite_width)) {
        var right_x = block_below_right.x;
        var right_y = block_below_right.y;
        instance_destroy(block_below_right);
        falling_wall_right = instance_create(right_x, right_y, oFallingWall);
        with (falling_wall_right) {
            vspd = player_vspd;
        }
    }
    if (instance_exists(block_below)) {
        var _x = block_below.x;
        var _y = block_below.y;
        instance_destroy(block_below);
        falling_wall = instance_create(_x, _y, oFallingWall);
        with (falling_wall) {
            vspd = player_vspd;
        }
    }
}

if (!place_meeting(x, y+1, oSolid)) { //Player is in the air
    vspd += 3*grav*grav;
} else {
    //Player on ground
        
    vspd = 0;
    state = move_state;
}


move(oSolid);

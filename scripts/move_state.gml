/// move_state

//Face in direction of motion
if (hspd != 0) {
    image_xscale = sign(hspd);
}

if (right) {
    hspd = spd;
    hspd_dir = 1;
}

if (left) {
    hspd = -spd;
    hspd_dir = -1;    
}

if (right || left) {
    hspd += (right-left)*acc;
    hspd_dir = right-left;
    
    if (hspd > spd) hspd = spd;
    if (hspd < -spd) hspd = -spd;
} else {
    apply_friction(acc);
}

if (!place_meeting(x, y+1, oSolid)) { //Player in air
    //Apply gravity
    vspd += grav;
    
    //Change to jump sprite
    //sprite_index = sPlayer_jumping;
    
    if (down) {
        vspd = 0;
        hspd = 0;
        state = stomp_state;
    }
    /*
    // Control jump height
    if (up_release && vspd < -6) {
        vspd = -6; //min jump height
    }
    */
} else { //Player is on ground
    //Stop vertical motion
    vspd = 0;
    
    //Allow jump
    // Jump
    if (up) {
        vspd = -jspd;//* sqrt(sqrt(_sprint_multiplier));
        //audio_play_sound(snd_jump, 5, false);
        
        // Create some dust
        repeat (irandom_range(4, 6)) {
            // Create within an area
            var rand_x = irandom_range(-8, 8);
            var rand_y = irandom_range(-4, 4);
            instance_create(x+rand_x, y+rand_y+(sprite_height/2), oDust);
        }
    }
}

//If about to hit ground
if (place_meeting(x, y+vspd+1, oSolid) && vspd > 0) {
    //Play the landing sound
    //audio_emitter_pitch(audio_em, random_range(.8, 1.2));
    //audio_emitter_gain(audio_em, .2);
    //audio_play_sound_on(audio_em, snd_step, false, 6);
    
    // Create some dust
    repeat (irandom_range(2, 4)) {
        // Create within an area
        var rand_x = irandom_range(-8, 8);
        var rand_y = irandom_range(-4, 4);
        instance_create(x+rand_x, y+rand_y+(sprite_height/2), oDust);
    }
}

move(oSolid);

/// move_block()
///move_block(collision_object)
var collision_object = argument0;

// In the air
if (!place_meeting(x, y+1, collision_object)) {
    vspd += grav; //apply gravity
}

// Horizontal Collisions
if (place_meeting(x+hspd, y, collision_object)) {
    while (!place_meeting(x+sign(hspd), y, collision_object)) {
        x += sign(hspd);
    }
    hspd = 0;
}
x += hspd;

// Vertical Collisions
if (place_meeting(x, y+vspd, collision_object)) {
    while (!place_meeting(x, y+sign(vspd), collision_object)) {
        y += sign(vspd);
    }
    vspd = 0;
}
y += vspd;

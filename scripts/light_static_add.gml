///light_static_add(light_sprite,subimage,x,y,xscale,yscale,angle,blend,cast_shadows)
//NOTICE: A new sprite is created when you create a static light, which is automatically destroyed when you delete the light
//light_sprite must exist
//Use enum SHADOWS, add them together to mix
//No shadows = SHADOWS.NONE
//Static shadows = SHADOWS.STATIC
//Dynamic shadows = SHADOWS.DYNAMIC
//Static and dynamic shadows = SHADOWS.STATIC + SHADOWS.DYNAMIC
//returns the ID of the light
if(!sprite_exists(argument0)) {
    exit;
}
var m, nl, w, h, xo, yo;
m = ds_map_create();
w = sprite_get_width(argument0) * argument4;
h = sprite_get_height(argument0) * argument5;
xo = sprite_get_xoffset(argument0) * argument4;
yo = sprite_get_yoffset(argument0) * argument5;
nl = surface_cache_create(w, h);
surface_set_target(nl);
draw_clear_alpha(0, 1);
draw_sprite_ext(argument0, argument1, xo, yo, argument4, argument5, 0, c_white, 1);
if(argument8 == 1 || argument8 == 3) {
    d3d_transform_stack_push();
    d3d_transform_set_translation(-argument2, -argument3, 0);
    d3d_transform_add_rotation_z(-argument6);
    d3d_transform_add_translation(xo, yo, 0);
    draw_set_color(c_black);
    caster_static_draw_all(argument2, argument3, LS_do_culling, argument2 - xo, argument3 - yo, argument2 - xo + w, argument3 - yo - h);
    d3d_transform_stack_pop();
}
surface_reset_target();
m[?"sprite"] = sprite_create_from_surface(nl, 0, 0, w, h, 0, 0, xo, yo);
m[?"x"] = argument2;
m[?"y"] = argument3;
m[?"angle"] = argument6;
m[?"blend"] = argument7;
m[?"shadows"] = argument8;
m[?"enabled"] = 1;
ds_list_add(LS_static_lights, m);
return m;

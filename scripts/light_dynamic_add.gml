///light_dynamic_add(light_sprite,subimage,x,y,xscale,yscale,angle,blend,cast_shadows,destroy_on_delete)
//destroy_on_delete must be set to 1 if you want the light_dynamic_delete(...) function to delete the sprite resource too, use this for procedurally generated light sprites
//light_sprite must exist
//Use enum SHADOWS, add them together to mix
//No shadows = SHADOWS.NONE
//Static shadows = SHADOWS.STATIC
//Dynamic shadows = SHADOWS.DYNAMIC
//Static and dynamic shadows = SHADOWS.STATIC + SHADOWS.DYNAMIC
//returns the ID of the light or -1 on error
if(!sprite_exists(argument0)) {
    return -1;
}
var m = ds_map_create();
m[?"sprite"] = argument0;
m[?"image"] = argument1;
m[?"x"] = argument2;
m[?"y"] = argument3;
m[?"xscale"] = argument4;
m[?"yscale"] = argument5;
m[?"angle"] = argument6;
m[?"blend"] = argument7;
m[?"shadows"] = argument8;
m[?"enabled"] = 1;
m[?"sprite_delete"] = argument9;
ds_list_add(LS_dynamic_lights, m);
return m;

///light_dynamic_delete(id)
if(argument0[?"sprite_delete"]) {
    sprite_delete(argument0[?"sprite"]);
}
ds_map_destroy(argument0);
ds_list_delete(LS_dynamic_lights, ds_list_find_index(LS_dynamic_lights, argument0));

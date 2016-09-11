///light_static_delete(id)
sprite_delete(argument0[?"sprite"]);
ds_map_destroy(argument0);
ds_list_delete(LS_static_lights, ds_list_find_index(LS_static_lights, argument0));

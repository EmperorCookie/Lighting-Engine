///caster_static_delete(id)
ds_map_destroy(argument0);
ds_list_delete(LS_static_casters, ds_list_find_index(LS_static_casters, argument0));

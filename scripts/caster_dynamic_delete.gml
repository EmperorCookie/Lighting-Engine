///caster_dynamic_delete(id)
ds_map_destroy(argument0);
ds_list_delete(LS_dynamic_casters, ds_list_find_index(LS_dynamic_casters, argument0));

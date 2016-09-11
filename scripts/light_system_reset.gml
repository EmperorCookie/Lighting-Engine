///light_system_reset()
//Deletes every light and every caster
while(ds_list_size(LS_static_lights) > 0) {
    light_static_delete(LS_static_lights[|0]);
}
while(ds_list_size(LS_dynamic_lights) > 0) {
    light_dynamic_delete(LS_dynamic_lights[|0]);
}
while(ds_list_size(LS_static_casters) > 0) {
    caster_static_delete(LS_static_casters[|0]);
}
while(ds_list_size(LS_dynamic_casters) > 0) {
    caster_dynamic_delete(LS_dynamic_casters[|0]);
}

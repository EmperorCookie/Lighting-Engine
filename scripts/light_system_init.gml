///light_system_init()
//You must call this script before any other
//MAKE SURE YOU CALL THIS SCRIPT ONLY ONCE
//Views must be enabled in order for this lighting engine to work
//If you do not want to use views, simply set the view to cover the whole room
globalvar LS_static_lights, LS_dynamic_lights, LS_static_casters, LS_dynamic_casters, LS_do_culling, LS_surface;
LS_surface = -1;
LS_static_lights = ds_list_create();
LS_dynamic_lights = ds_list_create();
LS_static_casters = ds_list_create();
LS_dynamic_casters = ds_list_create();
surface_cache_init();
LS_do_culling = false;
// SHADOWS ENUM //
enum SHADOWS {
    NONE = 0,
    STATIC = 1,
    DYNAMIC = 2,
}

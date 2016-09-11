///surface_cache_create(w,h)
//Use this function the exact same way you would use surface_create
//To benefit from the surface cache system, do not free the surfaces after using them
//Do not forget to draw_clear the surface before using it
//This script is best used when the surface is to be used immediately and then discarded
argument0 = round(argument0);
argument1 = round(argument1);
var str = string(argument0) + "," + string(argument1);
var sur = -1;
if(ds_map_exists(SC_surface_cache, str)) {
    sur = SC_surface_cache[?str];
}
if(surface_exists(sur)) {
    if(surface_get_width(sur) == argument0 && surface_get_height(sur) == argument1) {
        return sur;
    }
    surface_free(sur);
}
sur = surface_create(argument0, argument1);
SC_surface_cache[?str] = sur;
return sur;

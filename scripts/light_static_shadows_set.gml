///light_static_shadows_set(id,shadows)
//Use enum SHADOWS, add them together to mix
//No shadows = SHADOWS.NONE
//Static shadows = SHADOWS.STATIC
//Dynamic shadows = SHADOWS.DYNAMIC
//Static and dynamic shadows = SHADOWS.STATIC + SHADOWS.DYNAMIC
//Note: Static shadows are rendered when the static light is created so changing it here won't do anything
argument0[?"shadows"] = argument1;

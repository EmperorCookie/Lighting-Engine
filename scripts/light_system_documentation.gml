///light_system_documentation()
/*
light_system_init()
You must call this script before any other
MAKE SURE YOU CALL THIS SCRIPT ONLY ONCE
Views must be enabled in order for this lighting engine to work
If you do not want to use views, simply set the view to cover the whole room

light_system_draw(ambiant_light_color)
This function does not support different blend modes or d3d_transforms
To draw the light system using additive blend mode, use light_system_draw_add(..) instead

light_system_draw_add(ambiant_light_color)
If you want to draw the lights additively, use this script instead.

light_system_reset()
Deletes every light and every caster

light_system_culling_set(enabled)
 It is recommended to only enable culling if you are using YYC as your target platform

light_system_culling_get()

light_pointlight_create(radius)
 RETURNS: sprite_index

light_static_add(light_sprite,subimage,x,y,xscale,yscale,angle,blend,cast_shadows)
NOTICE: A new sprite is created when you create a static light, which is automatically destroyed when you delete the light
light_sprite must exist
shadows = 0 = no shadows
shadows = 1 = static shadows
shadows = 2 = dynamic shadows
shadows = 3 = static and dynamic shadows
returns the ID of the light

light_static_delete(id)

light_static_enabled_set(id,enabled)

light_static_enabled_get(id)

light_static_blend_set(id,new_blend)

light_static_blend_get(id)

light_static_shadows_set(id,shadows)
shadows = 0 = no shadows
shadows = 1 = static shadows
shadows = 2 = dynamic shadows
shadows = 3 = static and dynamic shadows
Note: Static shadows are rendered when the static light is created so changing it here won't do anything

light_static_shadows_get(id)

light_static_draw_all(blend_mode)
Blend mode to draw the lights in
WARNING: BLEND MODE IS SET NOT RESET AT THE END OF FUNCTION

light_dynamic_add(light_sprite,subimage,x,y,xscale,yscale,angle,blend,cast_shadows,destroy_on_delete)
destroy_on_delete must be set to 1 if you want the light_dynamic_delete(...) function to delete the sprite resource too, use this for procedurally generated light sprites
light_sprite must exist
shadows = 0 = no shadows
shadows = 1 = static shadows
shadows = 2 = dynamic shadows
shadows = 3 = static and dynamic shadows
returns the ID of the light or -1 on error

light_dynamic_delete(id)

light_dynamic_enabled_set(id,enabled)

light_dynamic_enabled_get(id)

light_dynamic_sprite_set(id,new_sprite)

light_dynamic_sprite_get(id)

light_dynamic_image_set(id,new_image_index)

light_dynamic_image_get(id)

light_dynamic_follow(id,x_offset,y_offset,angle_offset)
Follows calling object's (x, y, image_angle)
This function should be called last, after all movement is done (end_step_event)
x_offset/y_offset are rotated with image_angle

light_dynamic_position_set(id,new_x,new_y)

light_dynamic_x_get(id)

light_dynamic_y_get(id)

light_dynamic_move(id,new_x,new_y)

light_dynamic_scale_set(id,xscale,yscale)

light_dynamic_xscale_get(id)

light_dynamic_yscale_get(id)

light_dynamic_angle_set(id,new_angle)

light_dynamic_angle_get(id)

light_dynamic_rotate(id,angle)

light_dynamic_blend_set(id,new_blend)

light_dynamic_blend_get(id)

light_dynamic_shadows_set(id,shadows)
shadows = 0 = no shadows
shadows = 1 = static shadows
shadows = 2 = dynamic shadows
shadows = 3 = static and dynamic shadows

light_dynamic_shadows_get(id)

light_dynamic_draw_all(blend_mode)
Blend mode to draw the lights in
WARNING: BLEND MODE IS SET NOT RESET AT THE END OF FUNCTION

caster_static_add(x1,y1,x2,y2)
returns the ID of the caster

caster_static_delete(id)

caster_static_draw_all(center_x,center_x,cull?,cull_x1,cull_y1,cull_x2,cull_y2)
Before calling this function, be sure to set the d3d_transform stack to position the drawings as you want them

caster_dynamic_add(x1,y1,x2,y2)
returns the ID of the caster

caster_dynamic_delete(id)

caster_dynamic_x1_get(id)

caster_dynamic_y1_get(id)

caster_dynamic_x2_get(id)

caster_dynamic_y2_get(id)

caster_dynamic_point1_set(id,new_x,new_y)

caster_dynamic_point2_set(id,new_x,new_y)

caster_dynamic_position_set(id,new_x1,new_y1,new_x2,new_y2)

caster_dynamic_point1_move(id,move_x,move_y)

caster_dynamic_point2_move(id,move_x,move_y)

caster_dynamic_move(id,move_x,move_y)

caster_dynamic_follow(id,x1_offset,y1_offset,x2_offset,y2_offset,angle_offset)

caster_dynamic_draw_all(center_x,center_x,cull?,cull_x1,cull_y1,cull_x2,cull_y2)
Before calling this function, be sure to set the d3d_transform stack to position the drawings as you want them

vector_rotate_x(x,y,angle)

vector_rotate_y(x,y,angle)

line_cross_rectangle(line_x1,line_y1,line_x2,line_y2,rect_x1,rect_y1,rect_x2,rect_y2)

surface_cache_init()

surface_cache_create(w,h)
Use this function the exact same way you would use surface_create
To benefit from the surface cache system, do not free the surfaces after using them
Do not forget to draw_clear the surface before using it
This script is best used when the surface is to be used immediately and then discarded

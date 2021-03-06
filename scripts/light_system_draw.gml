///light_system_draw(ambiant_light_color)
//This function does not support different blend modes or d3d_transforms
//To draw the light system using additive blend mode, use light_system_draw_add(..) instead
if(argument0 != c_white) {
    var vw = view_wview[view_current] + 4;
    var vh = view_hview[view_current] + 4;
    if(!surface_exists(LS_surface)) {
        LS_surface = surface_create(vw, vh);
    } else {
        if(vw != surface_get_width(LS_surface) || vh != surface_get_height(LS_surface)) {
            surface_resize(LS_surface, vw, vh);
        }
    }
    d3d_transform_stack_push();
    d3d_transform_set_identity();
    surface_set_target(LS_surface);
    draw_clear_alpha(c_white - argument0, 1);
    // SET D3D TRANSFORMS //
    d3d_transform_add_translation(-view_xview[view_current] - view_wview[view_current] * 0.5, -view_yview[view_current] - view_hview[view_current] * 0.5, 0);
    d3d_transform_add_rotation_z(view_angle[view_current]);
    d3d_transform_add_translation(view_wview[view_current] * 0.5 + 2, view_hview[view_current] * 0.5 + 2, 0);
    // DRAW LIGHTS //
    light_static_draw_all(bm_subtract);
    light_dynamic_draw_all(bm_subtract);
    surface_reset_target();
    // SET D3D TRANSFORMS //
    d3d_transform_set_translation(-view_wview[view_current] * 0.5 - 2, -view_hview[view_current] * 0.5 - 2, 0);
    d3d_transform_add_rotation_z(-view_angle[view_current]);
    d3d_transform_add_translation(view_xview[view_current] + view_wview[view_current] * 0.5, view_yview[view_current] + view_hview[view_current] * 0.5, 0);
    // DRAW THE COMBINED RESULT TO THE VIEW //
    draw_surface(LS_surface, 0, 0);
    // RESET TRANSFORMS AND BLEND MODE //
    d3d_transform_stack_pop();
    draw_set_blend_mode(bm_normal);
}

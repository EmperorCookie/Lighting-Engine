///light_dynamic_draw_all(blend_mode)
//Blend mode to draw the lights in
//WARNING: BLEND MODE IS SET NOT RESET AT THE END OF FUNCTION
var n, tl, w, h, xo, yo, l;
n = ds_list_size(LS_dynamic_lights);
draw_set_blend_mode(argument0);
for(var a = 0; a < n; a += 1) {
    l = LS_dynamic_lights[|a];
    if(!l[?"enabled"]) {
        continue;
    }
    if(l[?"shadows"] < 1) {
        draw_sprite_ext(l[?"sprite"], 0, l[?"x"], l[?"y"], l[?"xscale"], l[?"yscale"], l[?"angle"], l[?"blend"], 1);
    } else {
        w = sprite_get_width(l[?"sprite"]);
        h = sprite_get_height(l[?"sprite"]);
        xo = sprite_get_xoffset(l[?"sprite"]);
        yo = sprite_get_yoffset(l[?"sprite"]);
        d3d_transform_stack_push();
        d3d_transform_set_identity();
        tl = surface_cache_create(w, h);
        surface_set_target(tl);
        draw_set_blend_mode(bm_normal);
        draw_clear_alpha(0, 1);
        draw_sprite(l[?"sprite"], 0, xo, yo);
        d3d_transform_add_translation(-l[?"x"], -l[?"y"], 0);
        d3d_transform_add_scaling(1 / l[?"xscale"], 1 / l[?"yscale"], 0);
        d3d_transform_add_rotation_z(-l[?"angle"]);
        d3d_transform_add_translation(xo, yo, 0);
        draw_set_color(c_black);
        if(l[?"shadows"] != 2) {
            caster_static_draw_all(l[?"x"], l[?"y"], LS_do_culling, l[?"x"] - xo, l[?"y"] - yo, l[?"x"] - xo + w, l[?"y"] - yo - h);
        }
        if(l[?"shadows"] >= 2) {
            caster_dynamic_draw_all(l[?"x"], l[?"y"], LS_do_culling, l[?"x"] - xo, l[?"y"] - yo, l[?"x"] - xo + w, l[?"y"] - yo - h);
        }
        d3d_transform_stack_pop();
        surface_reset_target();
        draw_set_blend_mode(argument0);
        draw_surface_ext(tl, l[?"x"] - vector_rotate_x(xo * l[?"xscale"], yo * l[?"yscale"], l[?"angle"]), l[?"y"] - vector_rotate_y(xo * l[?"xscale"], yo * l[?"yscale"], l[?"angle"]), l[?"xscale"], l[?"yscale"], l[?"angle"], l[?"blend"], 1);
    }
}

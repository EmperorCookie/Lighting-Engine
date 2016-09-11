///light_dynamic_rotate(id,angle)
var na = argument0[?"angle"] + argument1;
argument0[?"angle"] = na mod 360 + 360 * (na < 0);

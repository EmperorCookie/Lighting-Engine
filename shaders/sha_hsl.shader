//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.	
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Converts the HSV (Hue Saturation Value) colour receive to HSL (Hue Saturation Lightness)
// Loses half of colour space, but allows the emulation of HDR by "whiteing" colours that are lighter than 50% gray
// When used in conjunction with the lighting engine, adjust the ambiant light progressively to emulate a change in the dynamic range
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main() {
    vec4 basecol = texture2D(gm_BaseTexture, v_vTexcoord) * v_vColour;
    gl_FragColor.rgb = mix(basecol.rgb * vec3(2.0), vec3(1.0), max(0.0, max(max(basecol.r, basecol.g), basecol.b) * 2.0 - 1.0));
    gl_FragColor.a = basecol.a;
}


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
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

// SOURCE TEXTURE'S TEXEL WIDTH / HEIGHT
uniform vec2 u_texel;
// DITHER PATTERN TEXTURE, CHANNELS ARE RESPECTED, MUST BE POWER OF 2 AND SET TO "USED IN 3D"
uniform sampler2D u_dither_texture;
// RESOLUTION OF THE DITHER PATTERN
uniform float u_dither_res;
// COLOUR PRECISION, THE HIGHER THE MORE COLOURS (UNDEFINED BEHAVIOUR IF NOT AN INTEGER VALUE)
uniform float u_precision;

void main()
{
    vec4 basecol = texture2D(gm_BaseTexture, v_vTexcoord) * v_vColour;
    vec2 dithercoord = mod(v_vTexcoord / u_texel, u_dither_res) / u_dither_res;
    vec4 dithercol = (texture2D(u_dither_texture, dithercoord) - 0.5) / u_precision;
    gl_FragColor = floor((basecol + dithercol) * u_precision + 0.5) / u_precision;
}


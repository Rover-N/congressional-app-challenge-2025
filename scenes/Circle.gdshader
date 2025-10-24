shader_type canvas_item;

uniform vec2 center = vec2(0.5, 0.5);
uniform float inner_radius = 0.3;
uniform float outer_radius = 0.45;
uniform float feather = 0.01;

void fragment() {
    vec2 uv = UV;
    float dist = distance(uv, center);

    // 1 where the ring is, 0 elsewhere (smooth edges)
    float ring = smoothstep(inner_radius, inner_radius + feather, dist)
               * (1.0 - smoothstep(outer_radius - feather, outer_radius, dist));

    vec4 original = texture(TEXTURE, uv);

    // keep original RGB, scale alpha by ring
    COLOR = vec4(original.rgb, original.a * ring);
}

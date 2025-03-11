shader_type sky;

#include "res://addons/ShaderLib_v2_2_4/Artistic/Artistic.gdshaderinc"
#include "res://addons/ShaderLib_v2_2_4/UV/UV.gdshaderinc"


group_uniforms Stars;
uniform float star_height = 5.0;
uniform float star_blend : hint_range(0.0, 1.0, 0.01) = 0.1;
uniform float depth_blend : hint_range(0.0, 1.0, 0.01) = 0.1;
uniform float flare_ratio : hint_range(0.0, 1.0, 0.01) = 0.1;
uniform float star_size = 5.0;
uniform float twinkle_speed = 5.0;
uniform int star_layers = 3;
group_uniforms;

group_uniforms Nebula;
uniform sampler2D nebula_tex;
uniform sampler2D nebula_mask;
uniform float nebula_scale = 0.01;
uniform float nebular_blend : hint_range(0.0, 1.0, 0.01) = 0.1;
uniform float nebula_power = 1.5;
uniform int nebula_layers = 3;
uniform vec3 nebula_colour_adjust = vec3(1);
group_uniforms;

vec2 RandomVec2(vec2 seed) {
	seed = fract(seed * vec2(123.45, 784.29));
	seed += dot(seed, seed * 875.34);
	float x = fract(seed.x * 164.32);
	float y = fract(seed.y * 287.21);
	return vec2(x, y) - 0.5;
}

float Star(vec2 uv, float flare) {
	float star = 0.01 / length(uv);
	float rays  = max(0, 1.0 - abs(uv.x * uv.y) * 1000.0) * star;
	star += rays * flare;
	return pow(star, 3);
}

float Nebula(vec2 uv, vec2 speed) {
	float nebula = texture(nebula_tex, uv + speed).r;
	float mask = texture(nebula_mask, uv - speed * 0.5).r;
	nebula *= mask;
	nebula = pow(nebula, nebula_power);
	return nebula;
}

vec3 StarLayer(vec2 uv) {
	vec2 grid_uv = fract(uv) - 0.5; 
	vec2 grid_id = floor(uv);
	vec3 stars = vec3(0);
	
	for (float y = -1.0; y <= 1.0; y++) {
		for (float x = -1.0; x <= 1.0; x++) {
			vec2 offset = vec2(x, y);
			vec2 rv = RandomVec2(grid_id + offset);
			float size = star_size * (rv.x + 0.5);
			float animated_size = size * (0.4 * sin(TIME * rv.x * twinkle_speed) + 0.6);
			float flare = smoothstep(star_size * (1.0 - flare_ratio), star_size, size);
			vec3 star_colour = hue(vec3(1, 0, 0), rv.y * 2.0, 1);
			star_colour *= vec3(1, 0.2, 1.0 * size);
			stars += Star(grid_uv - offset - rv, flare) * animated_size * star_colour;
		}
	}
	return stars;
}

void sky() {
	float blend = smoothstep(star_blend, 1, abs(EYEDIR.y));
	float depth_curve = pow(abs(EYEDIR.y), depth_blend);
	
	for (float i = 1.0; i <= float(star_layers); i++) {
		vec2 uv = EYEDIR.xz / depth_curve * star_height * i;
		uv += RandomVec2(vec2(i, i + 34.0)) * i * 4.4;
		if (EYEDIR.y < 0.0) {
			uv = rotate_uv(uv, vec2(0), 170, true);
		}
		vec2 grid_uv = fract(uv) - 0.5; 
		vec2 grid_id = floor(uv);
		vec3 stars = vec3(0);
	
		for (float y = -1.0; y <= 1.0; y++) {
			for (float x = -1.0; x <= 1.0; x++) {
				vec2 offset = vec2(x, y);
				vec2 rv = RandomVec2(grid_id + offset);
				float size = star_size * (rv.x + 0.5);
				float animated_size = size * (0.4 * sin(TIME * rv.x * twinkle_speed) + 0.6);
				float flare = smoothstep(star_size * (1.0 - flare_ratio), star_size, size);
				vec3 star_colour = hue(vec3(1, 0, 0), rv.y * 2.0, 1);
				star_colour *= vec3(1, 0.2, 1.0 * size);
				COLOR += Star(grid_uv - offset - rv, flare) * animated_size * star_colour * blend;
			}
		}
		
		vec4 nebula = vec4(0);
		float lacunarity = 0.1;
		float nebula_speed = 0.001;
		float hue_shift = 0.05;
		for (float i = 1.0; i <= float(nebula_layers); i++) {
			vec2 st = uv * nebula_scale * lacunarity;
			st = rotate_uv(st, vec2(0.5), 124.0 * ceil(EYEDIR.y * 0.5), true);
			nebula += vec4(Nebula(st, vec2(TIME * nebula_speed * sign(mod(i, 2) - 0.5))));
			nebula.rgb *= hue(vec3(1, 0.1, 0.1), hue_shift * nebula.x * EYEDIR.x, 1);
			nebula.rgb *= nebula_colour_adjust;
			lacunarity *= 2.5;
			nebula_speed *= 1.002;
			hue_shift *= 1.865;
		}
		nebula.rgb *= smoothstep(0, nebular_blend, abs(EYEDIR.y));
		FOG = nebula;
	}
}

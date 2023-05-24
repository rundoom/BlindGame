shader_type canvas_item;

void fragment() {
	if (texture(TEXTURE, UV) == vec4(0, 0, 0, 1)) {
		COLOR.a = 0.0;
	}
}

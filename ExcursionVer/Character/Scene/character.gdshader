shader_type spatial;
render_mode depth_test_disabled, skip_vertex_transform, unshaded, cull_disabled;

void vertex() {
  POSITION = vec4(VERTEX, 1.0);
}

void fragment() {
  // Implement your fragment shader logic here.  For a blackout effect,
  // simply set the color to black.
  ALBEDO = vec3(0.0); // Black color
}
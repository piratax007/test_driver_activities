class street {
  int street_width, street_height;
  bound_point[] left_boundary;
	bound_point[] right_boundary;

  street() {
    street_height = 500;
		street_width = 50;
    left_boundary = new bound_point[street_height];
		right_boundary = new bound_point[street_height];
  }

  void set_boundaries() {
    for (int i = 0; i < street_height; i+=5) {
      left_boundary[i] = new bound_point(i, i, 10, 6, width/2);
      right_boundary[i] = new bound_point(i, i, 10, 6, width/2);
    }
  }

  void draw_boundaries(float A) {
		noStroke();
		fill(97, 97, 120);
		for (int i = 0; i < street_height; i+=5) {
			ellipse(left_boundary[i].horizontal_position(A), left_boundary[i].vertical_position, 5, 5);
			ellipse(right_boundary[i].horizontal_position(A)+street_width, right_boundary[i].vertical_position, 5, 5);
		}
  }

	class bound_point {
    float initial_theta, vertical_position, B, C, D;

    bound_point(float theta_i, float k, float period_modifier, float horizontal_offset, float verical_offset) {
      initial_theta = theta_i;
      vertical_position = k;
      B = period_modifier;
      C = horizontal_offset;
      D = verical_offset;
    }

    float horizontal_position(float A) {
      return A * sin(B * (initial_theta += 0.003) + C) + D;
    }
  }
}

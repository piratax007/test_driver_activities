class street {
  float x, y, B, C, D, center_horizontal_position, center_vertical_position;
  int street_width, street_height;
  bound_point[] left_boundary;

  street(float X, float Y, float T, float dh, float dv) {
    C = dh;
    B = T;
    D = dv;
    x = X;
    y = Y;
  }

  street() {
    street_height = 500;
    left_boundary = new bound_point[street_height];
  }

  void dibuja(float A) {
    noStroke();
    fill(52, 52, 179);
    ellipse(A * sin(B * (x += 0.003) + C) + D, y, 5, 5);
  }

  void draw_street() {
  }

  void set_boundary() {
    for (int i = 0; i < street_height; i+=5) {
      left_boundary[i] = new bound_point(i, i, 10, 6, width / 2);
    }
  }

  class bound_point {
    float horizontal_position, vertical_position, B, C, D;

    bound_point(float h, float k, float period_modifier, float horizontal_offset, float verical_offset) {
      horizontal_position = h;
      vertical_position = k;
      B = period_modifier;
      C = horizontal_offset;
      D = verical_offset;
    }

    void draw_bound_point() {
      noStroke();
      fill(52, 52, 179);
      ellipse(horizontal_position(A), vertical_position, 5, 5);
    }

    float horizontal_position(float A) {
      return A * sin(B * (x += 0.003) + C) + D;
    }
  }
}

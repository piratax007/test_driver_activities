class street{
  float x, y, A, B, C, D;
  
  street(float X, float Y, float T, float dh, float dv){
    C = dh;
    B = T;
    D = dv;
    x = X;
    y = Y;
  }
  
  void dibuja(float A){
    noStroke();
    fill(52, 52, 179);
    ellipse(A * sin(B * (x += .003) + C) + D, y, 5, 5);
  }

}
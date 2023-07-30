import processing.serial.*;
Serial portUSB;

street left_street = new street();
street right_street = new street();
int time;
float A, absL, absR;

// Variables de comunicación
boolean firstContact = false;
int[] valorSerie = new int[2];
int seriesContados = 0;

void setup() {
  size(400, 500);
  portUSB = new Serial(this, "/dev/ttyUSB0", 9600);
	
  left_street.set_boundaries(width/8);
	right_street.set_boundaries(3*width/4);
	
  time = second();
  A = 25;
  absL = 0;
  absR = 0;
}

void draw() {
  background(175);
  int control = int(random(0, 2));
	
  if (second() == time) {
    if (control == 0) {
      A -= 0.1;
    }
    else{
      A += 0.1;
    }
  }

	left_street.draw_boundaries(A);
	right_street.draw_boundaries(A);
  
  fill(196, 40, 40);
  ellipse(absL, height / 2, 5, 5);
  ellipse(absR, height / 2, 5, 5);
}

/*void keyPressed(){
  if (key == 'q'){
    absL -= 1;
  }
  if (key == 'w'){
    absL += 1;
  }
  if (keyCode == LEFT){
    absR -= 1;
  }
  if (keyCode == RIGHT){
    absR += 1;
  }
}*/

void serialEvent(Serial portUSB){
  int inByte = portUSB.read();
  if (firstContact == false){
    if (inByte == 'A'){
      portUSB.clear();
      firstContact = true;
      portUSB.write('A');
    }
  }
  else{
    valorSerie[seriesContados] = inByte;
    seriesContados ++;
    if (seriesContados > 1){
      absL = map(valorSerie[0], 0, 255, 0, 200);
      absR = map(valorSerie[1], 0, 255, 200, 400);
      portUSB.write('A');
      seriesContados = 0;           
    }
  }
}

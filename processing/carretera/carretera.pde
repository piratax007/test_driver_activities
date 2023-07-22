import processing.serial.*;
Serial portUSB;

street[] calle = new street[500];
street[] calle1 = new street[500];
street[] calle2 = new street[500];
street[] calle3 = new street[500];
int time;
float A, absL, absR;

// Variables de comunicación
boolean firstContact = false;
int[] valorSerie = new int[2];
int seriesContados = 0;

void setup(){
  size(400, 500);
  portUSB = new Serial(this, "/dev/ttyUSB0", 9600);
  for (int i = 0; i < calle.length; i+=5){
    calle[i] = new street(i * 0.01, i, 5, 6, 75);
    calle1[i] = new street(i * 0.01, i, 5, 6, 145);
    calle2[i] = new street(i * 0.01, i, 4, -1, 325);
    calle3[i] = new street(i * 0.01, i, 4, -1, 255);
  }
  time = second();
  A = 25;
  absL = 0;
  absR = 0;
}

void draw(){
  background(175);
  int control = int(random(0, 2));
  if (second() == time){
    if (control == 0){
      A -= 0.1;
    }
    else{
      A += 0.1;
    }
  }
  for (int i = 0; i < calle.length; i+=5){
    calle[i].dibuja(A + 10);
    calle1[i].dibuja(A + 10);
    calle2[i].dibuja(A + 10);
    calle3[i].dibuja(A + 10);
  }
  
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

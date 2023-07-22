/*
Este skecth configura Arduino para enviar el valor de
dos potenciometros a través de puerto serie (USB)
piratax007
20160628
GPLv3
*/

int leftPotenciometer = A0;
int valueLeftPotenciometer = 0;
int rightPotenciometer = A1;
int valueRightPotenciometer = 0;
int inByte = 0;

void setup() {
  Serial.begin(9600);
  establishContact();
}

void loop() {
  if (Serial.available() > 0){
    inByte = Serial.read();
    valueLeftPotenciometer = map(analogRead(leftPotenciometer), 0, 1023, 0, 255);
    delay(10);
    valueRightPotenciometer = map(analogRead(rightPotenciometer), 0, 1023, 0, 255);
    Serial.write(valueLeftPotenciometer);
    Serial.write(valueRightPotenciometer);
    delay(10);
  }
}

void establishContact(){
  while (Serial.available() <= 0){
    Serial.print('A');
    delay(300);
  }
}

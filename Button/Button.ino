int switchPin = 2;                      
boolean estado = false;
boolean estado0 = false;

void setup() {
  pinMode(switchPin, INPUT);             
  Serial.begin(9600);                  
}

void loop() {
  estado0 = estado;
  if (digitalRead(switchPin) == HIGH) {  
    estado = true;
  } else {                              
    estado = false;
  }

  if(estado==true && estado0!=estado){
        Serial.write(1);  
        delay(100);  
  }
  if(estado==false && estado0!=estado){
        Serial.write(2);  
        delay(100);  
  
  }
  if(estado==true){
        Serial.write(3);  
        delay(100);  
  }
  if(estado==false){
        Serial.write(4);  
        delay(100);  
  }

}

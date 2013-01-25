import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import processing.serial.*;
import gifAnimation.*;
//////////////////////////////////////////
Minim minim;
AudioPlayer player;
int posX=0;
int posY=0;
Serial myPort;
int val;
int i=0;
int j=0;
Gif LoopingGif1;
Gif LoopingGif2;
Gif LoopingGif3;
boolean so=false;
/////////////////////////////mouse animations
//PImage[] animation1;
//PImage[] animation2;
//PImage[] animation3;

public void setup() {
  background(0);
  size(1100, 662);
  frameRate(100);
  minim = new Minim(this);
  player = minim.loadFile("audio.mp3", 2048);
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
  
  LoopingGif1 = new Gif(this, "gif1.gif");
  LoopingGif1.loop();
  LoopingGif2 = new Gif(this, "gif2.gif");
  LoopingGif2.loop();
  LoopingGif3 = new Gif(this, "gif3.gif");
  LoopingGif3.loop();
////////////////////////////////////////////////// 
 // animation1 = Gif.getPImages(this, "teia.gif");
 // animation2 = Gif.getPImages(this, "arvore_reflexosaturation.gif");
 // animation3 = Gif.getPImages(this, "sol.gif");
}

void draw() {
   if ( myPort.available() > 0) { 
    val = myPort.read();    
    println(val);
  }
  
   if(val==1){
     so=false;
     j=0;
     i++;
     delay(100);
  }
  if(val==3){
   posX=-2000;
   posY=-2000;
   fill(0);
   rect(0,0,width,height);
  }
  if(val!=3){
  posX=0;
  posY=0;
  }
  if(val==4){
    so=true;
    j++;
  }
  //image(animation1[(int) (animation.length / (float) (width) * mouseX)], 0,0, width, height);
   if(i==1){
     image(LoopingGif1, posX, posY,width,height);
  
   }
  if(i==2){
     //image(animation2[(int) (animation2.length / (float) (width) * mouseX)], 0,0, width, height);
     image(LoopingGif2, posX, posY,width,height);
       

  }
 
  if(i==3){
     //image(animation3[(int) (animation3.length / (float) (width) * mouseX)], 0,0, width, height);   
    image(LoopingGif3, posX, posY,width,height);  
     

}
  
  if(i==4){
    i=1;
  }
  
  if(so==true && j==1){
     player.play(12000);
     so=false;
  }
  
}
void stop()
{
  // always close Minim audio classes when you are done with them
  player.close();
  // always stop Minim before exiting
  minim.stop();
  super.stop();
}

boolean sketchFullScreen() {
  return true;
}

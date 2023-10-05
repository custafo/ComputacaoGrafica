import processing.sound.*;

SoundFile song;
MyThread anim;
Person2 person2;
Casa casa;
Terreno terra;
Ocean ocean;
Coqueiro coq;
float backg = 255;
boolean dia = true;

void setup(){
  size(640, 360);
  casa = new Casa(245, -200, 100);
  person2 = new Person2(casa.getX()+45, -casa.getY()+65, dia);
  terra = new Terreno();
  anim = new MyThread();
  ocean = new Ocean(height/1.25, dia);
  coq = new Coqueiro();

  song = new SoundFile(this, "Under the Sea.mp3");
  song.loop();

  noLoop();
  noSmooth();
}

void draw(){
  background(backg);
  if(dia == true && backg < 255)
  {
    backg+=5;
  }
  else if(dia == false && backg > 0)
  {
    backg-=5;
  }
  
  ocean.draw(dia);
  
  terra.draw();
  
  coq.draw();
  
  casa.draw();
  
  person2.draw(dia);
}

void keyPressed(){
  if(key == 'a')
  {
    if(dia == true)
    {
      dia = false;
    }
    else
    {
      dia = true;
    }
  }
  print(dia);
}

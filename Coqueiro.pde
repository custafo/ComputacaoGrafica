class Coqueiro{
  Coqueiro(){
    
  }
  
  void draw(){
  strokeWeight(8);
  line(406, 220, 409, 205);
  line(404, 220, 422, 212);
  line(404, 220, 392, 215);
  line(404, 220, 388, 230);
  line(404, 220, 430, 225);
  
  stroke(0,0,0);
  strokeWeight(2);
  for(int i = 400; i < 402; i++){
    line(i, 280, i, 250);
  }
  for(int i = 402; i < 404; i++){
    line(i, 250, i, 230);
  }stroke(184, 115, 51);
  for(int i = 404; i < 406; i++){
    line(i, 230, i, 220);
  }
  stroke(150, 96, 79);
  for(int i = 403; i < 411; i++){
    line(i, 280, i, 270);
  }
  stroke(184, 115, 51);
  for(int i = 403; i < 411; i++){
    line(i, 270, i, 250);
  }
  stroke(150, 96, 79);
  for(int i = 405; i < 411; i++){
    line(i, 250, i, 240);
  }
  stroke(184, 115, 51);
  for(int i = 405; i < 411;i++){
    line(i, 240, i, 230);
  }
  stroke(126, 96, 79);
  for(int i = 407; i < 411; i++){
    line(i, 230, i, 225);
  }
  stroke(0);
  for(int i = 410; i < 412; i++){
    line(i, 270, i, 240);
  }
  for(int i = 412; i < 414; i++){
    line(i, 280, i, 270);
  }
  for(int i = 412; i < 414; i++){
    line(i, 240, i, 225);
  }
  stroke(34,139,34);
  strokeWeight(8);
  line(406, 220, 409, 205);
  line(404, 220, 422, 212);
  line(404, 220, 392, 215);
  line(404, 220, 388, 230);
  line(404, 220, 430, 225);
  
  stroke(150, 90, 52);
  strokeWeight(11);
  point(403, 229);
  point(412, 225);
}
}

// João Gabriel e Pedro Benedito
import java.util.Random;
public class Nuvens{
 Random number = new Random();
 float[][] pontos = {{-20.0, 100.0}, {0.0, 100.0}};   
 float colors = 255.0;
 
 public Nuvens(){
   pontos[0][0] = number.nextInt(-100, -20);
   pontos[1][0] = pontos[0][0] + 10 + number.nextInt(20);
     
   pontos[0][1] = number.nextInt(90, 130);
   pontos[1][1] = pontos[0][1];
 }
 
 public void draw(){
   stroke(colors);
   strokeWeight(10);
   line(pontos[0][0], pontos[0][1], pontos[1][0], pontos[1][1]);
   move();
 }
 
 public void move(){
   for(int i = 0; i < pontos[0].length; i++){
     pontos[i][0] += 1;
   }
   if(pontos[0][0] > 640){
     pontos[0][0] = number.nextInt(-100, -20);
     pontos[1][0] = pontos[0][0] + 10 + number.nextInt(20);
     
     pontos[0][1] = number.nextInt(80, 160);
     pontos[1][1] = pontos[0][1];
   }
 }
}

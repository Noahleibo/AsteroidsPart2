Star[] nightSky = new Star[200];
Spaceship bob = new Spaceship();
int ast = 10;
ArrayList<asteroid> john = new ArrayList<asteroid>();
boolean left;
boolean right;
boolean forward;
boolean slow;
public void setup() 
{
  size(1000, 1000);
  for (int i = 0; i < nightSky.length; i++)
  {
    nightSky[i] = new Star();
  }
  for (int j = 0; j < ast; j++) {
    asteroid ast = new asteroid(); 
    john.add(ast);
  }
}
public void draw() 
{
  background(0);

  for (int j = (john.size()-1); j >= 0; j--)
  {
    john.get(j).move();
    john.get(j).show();
    float d = dist((float)bob.getX(), (float)bob.getY(), (float) john.get(j).getX(), (float) john.get(j).getY());
    if (d < 30){
    john.remove(j);
    }
  }
  for (int i = 0; i < nightSky.length; i++)
  {
    noStroke();
    nightSky[i].show();
  }
  for (int j = 0; j < john.size(); j++)
  {
    john.get(j).show();
  }
  bob.move();
  bob.show();

  if (forward == true) {
    bob.accelerate(0.1);
  }
  if (left == true) {
    bob.turn(-4);
  }
  if (right == true) {
    bob.turn(4);
  }
  if (slow == true) {
    bob.accelerate(-0.1);
  }
}
public void keyPressed() {
  if (key == 'q') {
    bob.setX(Math.random()*width);
    bob.setY(Math.random()*height);
    bob.setPoint(Math.random()*360);
  }
  if (key == 'w') {
    forward = true;
  }
  if (key == 'd') {
    right = true;
  }
  if (key == 'a') {
    left = true;
  }
  if (key == 's') {
    slow = true;
  }
  if (key == 'e') {
    bob.setXspeed(0);
    bob.setYspeed(0);
  }
}
public void keyReleased() {
  if (key == 'w') {
    forward = false;
  }
  if (key == 'd') {
    right = false;
  }
  if (key == 'a') {
    left = false;
  }
  if (key == 's') {
    slow = false;
  }
}

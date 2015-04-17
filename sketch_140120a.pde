public int h=600;
public int w=500;
ClockEasy a=new ClockEasy();

void setup() {
  size(w, h);
  a.setupinit();
}

void draw() {
  background(180);
  a.display();
  
}
void mousePressed()
{
  a.mousepressed();
}


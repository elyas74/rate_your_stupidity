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

abstract class Clock extends Game {
  ///////////// variables  
  float scale;
  PImage Clock;
  PImage Handle;
  PFont font;
  int i=0;
  ///////////// display
  @Override
    public void display() {
    fill(255);
    ///////////displaying "Clock"
    textAlign(LEFT);
    fill(150);
    textFont(font, w/10);
    text("Clock", w/25, h/10);
    ///////////
    if (h < w)
      scale = h/1.5;
    else 
      scale = w/1.5;
    if (h < w)
      scale = h/1.5;
    else 
      scale = w/1.5;
    image(Clock, w/2, h/3+h/50, scale, scale);
    
    
    /*
    translate(w/2, h/3+h/50);
    rotate(PI*i*2/360);
    image(Handle, 0, 0, scale/16, scale/1.2);
    rotate(PI*-i*2/360);////////////doing this for
    translate(-w/2, -(h/3+h/50));///rotating the handle only
    */
    
  }
  ///////////// setupinit
  @Override
    public void  setupinit() {
    //////////clock
    imageMode(CENTER);
    Handle = loadImage("images/Handle.png");
    Clock = loadImage("images/Clock.png");
    //////////font
    font=loadFont("BenBrown-48.vlw");
  }
  ///////////// Generating the clock formula
  public ArrayList generateF(int stage)
  {
    ArrayList<Integer> formula = new ArrayList<Integer>();
    int total=0;
    for (int i=0  ;i<stage ; i++)
    {
      int sign = int(random(2));
      if (sign == 0)
        sign = -1;
      int value = int(random(11)+1)*5;
      formula.add(value);
      total+=(value*sign);
    }
    total =total% 60;
    formula.add(total);
    return formula;
  }
  /////////// moving the handle here!
  public void moveHandle(float time) {
    
    float temp=(time*6*2*PI)/360;
    
      translate(w/2, h/3+h/50);
      rotate((i*2*PI)/360);
      image(Handle, 0, 0, scale/16, scale/1.2);
      rotate((-i*2*PI)/360);////////////doing this for
      translate(-w/2, -(h/3+h/50));///rotating the handle only
    if(time>0){
      if(i<time*6)
        i+=3;
    }
    else
      if(i>time*6)
        i-=3;
     
    
  }
}

public class ClockEasy extends Clock {
  //////////Variables
  int clk=0;
  private ArrayList<Integer> formula;
  private int finalvalue;
  private int[][] table = {
    {
      0, 0, 0
    }
    , {
      1, 1, 1
    }
    , {
      0, 0, 0
    }
  };
  //dispalying variables
  int H=2*h/3;
  int m=h/27;
  int m2=w/4;
  int m3=w/25;
  //
  //////////
  //////////constructor
  public ClockEasy() {
    formula = generateF(3);
    finalvalue = formula.get(3);
  }
  /////////
  ///////// ~function, gets to input and modifys the clock matrix
  public void setMatrix(int a, int b) {
    
      if(a == 0)
      {
          if(b == 0)
          {
              table[0][0] = 1;
              table[1][0] = 0;
              table[2][0] = 0;
          }
          else if(b == 1)
          {
              table[0][1] = 1;
              table[1][1] = 0;
              table[2][1] = 0;
          }
           else if(b == 2)
          {
              table[0][2] = 1;
              table[1][2] = 0;
              table[2][2] = 0;
          }
      }
      else if(a == 1)
      {
          if(b == 0)
          {
              table[0][0] = 0;
              table[1][0] = 1;
              table[2][0] = 0;
          }
          else if(b == 1)
          {
              table[0][1] = 0;
              table[1][1] = 1;
              table[2][1] = 0;
          }
           else if(b == 2)
          {
              table[0][2] = 0;
              table[1][2] = 1;
              table[2][2] = 0;
          }
      }
      else if(a == 2)
      {
          if(b == 0)
          {
              table[0][0] = 0;
              table[1][0] = 0;
              table[2][0] = 1;
          }
          else if(b == 1)
          {
              table[0][1] = 0;
              table[1][1] = 0;
              table[2][1] = 1;
          }
           else if(b == 2)
          {
              table[0][2] = 0;
              table[1][2] = 0;
              table[2][2] = 1;
          }
      }
  }
  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  @Override
    public void mousepressed()
  {
    ///////////// + buttons
    if (mouseY>H && mouseY<H+m) {
      if (mouseX>w/2-m-m2-m3 && mouseX<w/2+m-m2-m3) {
        setMatrix(0, 0);
      }
      else if (mouseX>w/2-m-m3 && mouseX<w/2+m-m3) {
        setMatrix(0, 1);
      }
      else if (mouseX>w/2-m+m2-m3 && mouseX<w/2+m+m2-m3) {
        setMatrix(0, 2);
      }
    }
    ///////////// Reset buttons
    else if (mouseY>H+1.5*m && mouseY<H+2.5*m) {
      if (mouseX>w/2-0.5*m-m2-m3 && mouseX<w/2+0.5*m-m2-m3) {
        setMatrix(1, 0);
      }
      else if (mouseX>w/2-0.5*m-m3 && mouseX<w/2+0.5*m-m3) {
        setMatrix(1, 1);
      }
      else if (mouseX>w/2-0.5*m+m2-m3 && mouseX<w/2+0.5*m+m2-m3) {
        setMatrix(1, 2);
      }
    }
    ///////////// - buttons
    else if (mouseY>H+3*m && mouseY<H+4*m) {
      if (mouseX>w/2-m-m2-m3 && mouseX<w/2+m-m2-m3) {
        setMatrix(2, 0);
      }
      else if (mouseX>w/2-m-m3 && mouseX<w/2+m-m3) {
        setMatrix(2, 1);
      }
      else if (mouseX>w/2-m+m2-m3 && mouseX<w/2+m+m2-m3) {
        setMatrix(2, 2);
      }
    }
  }
  public void visMatrix(int a,int b) {
    if(table[a][b]!=1){
      fill(255);
      return;
    }
    if(a==1)
      fill(255,0,0);     
   else
      fill(0,255,0);
  }
  @Override
    public void display()
  {
    super.display();
    
    moveHandle(400);

    fill(255);
    ///////////buttons 1
    visMatrix(0,0);
    triangle(w/2-m2-m3, H, w/2-m-m2-m3, H+m, w/2+m-m2-m3, H+m);
    
    visMatrix(1,0);
    ellipse(w/2-m2-m3, H+2*m, m, m);
    
    visMatrix(2,0);
    triangle(w/2-m-m2-m3, H+3*m, w/2+m-m2-m3, H+3*m, w/2-m2-m3, H+4*m);
    ///////////buttons 2
    visMatrix(0,1);
    triangle(w/2-m3, H, w/2-m-m3, H+m, w/2+m-m3, H+m);
    
    visMatrix(1,1);
    ellipse(w/2-m3, H+2*m, m, m);
    
    visMatrix(2,1);
    triangle(w/2-m-m3, H+3*m, w/2+m-m3, H+3*m, w/2-m3, H+4*m);
    ///////////buttons 3
    visMatrix(0,2);
    triangle(w/2+m2-m3, H, w/2-m+m2-m3, H+m, w/2+m+m2-m3, H+m);
    
    visMatrix(1,2);
    ellipse(w/2+m2-m3, H+2*m, m, m);
    
    visMatrix(2,2);
    triangle(w/2-m+m2-m3, H+3*m, w/2+m+m2-m3, H+3*m, w/2+m2-m3, H+4*m);
    ///////////
    textAlign(LEFT);
    textFont(font, w/8);
    fill(255);
    text(str(formula.get(0)), w/2+0.5*m, H+3.5*m);
    text(str(formula.get(1)), w/2-m2+0.5*m, H+3.5*m);
    text(str(formula.get(2)), w/2+m2+0.5*m, H+3.5*m);
  }
}

abstract class Game {
  abstract void setupinit();
  abstract void display();
  abstract void mousepressed();
}



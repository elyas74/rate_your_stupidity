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
    if(total < 0)
      total+=60;
    formula.add(total);
    return formula;
  }
  /////////// moving the handle here!
  public void moveHandle(float time,float Ptime) {
    
    float temp=(time*6*2*PI)/360;
    
      translate(w/2, h/3+h/50);
      rotate((i*2*PI)/360);
      image(Handle, 0, 0, scale/16, scale/1.2);
      rotate((-i*2*PI)/360);////////////doing this for
      translate(-w/2, -(h/3+h/50));///rotating the handle only
    if(time>Ptime){
      if(i<time*6)
        i+=3;
    }
    else
      if(i>time*6)
        i-=3;
     
    
  }
}


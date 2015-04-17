public class ClockEasy extends Clock {
  //////////Variables
  int clk=0;
  int Ptime;
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

    Ptime=clk;
        if (a == 0) {
            if (b == 0) {
                //if (table[0][0] == 1); 
                if (table[1][0] == 1) {
                    table[0][0] = 1;
                    table[1][0] = 0;
                    table[2][0] = 0;
                    clk += formula.get(0);
                } else if (table[2][0] == 1) {
                    table[0][0] = 0;
                    table[1][0] = 1;
                    table[2][0] = 0;
                    /////////////////////
                    table[0][0] = 1;
                    table[1][0] = 0;
                    table[2][0] = 0;
                    clk += 2 * formula.get(0);

                }
            }
            else if(b == 1)
            {
                //if (table[0][1] == 1); 
                if (table[1][1] == 1) {
                    table[0][1] = 1;
                    table[1][1] = 0;
                    table[2][1] = 0;
                    clk += formula.get(1);
                } else if (table[2][1] == 1) {
                    table[0][1] = 0;
                    table[1][1] = 1;
                    table[2][1] = 0;
                    /////////////////////
                    table[0][1] = 1;
                    table[1][1] = 0;
                    table[2][1] = 0;
                    clk += 2*formula.get(1);

                }
            }
            else if(b == 2)
            {
                //if (table[0][2] == 1); 
                if (table[1][2] == 1) {
                    table[0][2] = 1;
                    table[1][2] = 0;
                    table[2][2] = 0;
                    clk += formula.get(2);
                } else if (table[2][2] == 1) {
                    table[0][2] = 0;
                    table[1][2] = 1;
                    table[2][2] = 0;
                    /////////////////////
                    table[0][2] = 1;
                    table[1][2] = 0;
                    table[2][2] = 0;
                    clk += 2*formula.get(2);
                }
            }
        }
        else if(a == 1)
        {
            if(b == 0)
            {
                if(table[0][0] == 1)
                {
                    table[0][0] = 0;
                    table[1][0] = 1;
                    table[2][0] = 0;
                    clk -=formula.get(0);
                }
                //else if(table[1][0] == 1);
                else if(table[2][0] == 1)
                {
                    table[0][0] = 0;
                    table[1][0] = 1;
                    table[2][0] = 0;
                    clk+=formula.get(0);
                }
            }
            else if(b == 1)
            {
                if(table[0][1] == 1)
                {
                    table[0][1] =0;
                    table[1][1] = 1;
                    table[2][1] = 0;
                    clk -=formula.get(1);
                }
                //else if(table[1][1] == 1);
                else if(table[2][1] == 1)
                {
                    table[0][1] = 0;
                    table[1][1] = 1;
                    table[2][1] = 0;
                    clk+=formula.get(1);
                }
            }
            else if(b == 2)
            {
                if(table[0][2] == 1)
                {
                    table[0][2] =0;
                    table[1][2] = 1;
                    table[2][2] = 0;
                    clk -=formula.get(2);
                }
                //else if(table[1][2] == 1);
                else if(table[2][2] == 1)
                {
                    table[0][2] = 0;
                    table[1][2] = 1;
                    table[2][2] = 0;
                    clk+=formula.get(2);
                }
            }
        }
        else if(a == 2)
        {
            if(b == 0)
            {
                if(table[0][0] == 1)
                {
                    table[0][0] = 0;
                    table[1][0] = 1;
                    table[2][0] = 0;
                    ////////////////
                    table[0][0] = 0;
                    table[1][0] = 0;
                    table[2][0] = 1;
                    clk-=2*formula.get(0);
                }
                else if(table[1][0] == 1)
                {
                    table[0][0] = 0;
                    table[1][0] = 0;
                    table[2][0] = 1;
                    clk-=formula.get(0);
                }
                //else if(table[2][0] == 1);
            }
            else if(b == 1)
            {
                if(table[0][1] == 1)
                {
                    table[0][1] = 0;
                    table[1][1] = 1;
                    table[2][1] = 0;
                    ////////////////
                    table[0][1] = 0;
                    table[1][1] = 0;
                    table[2][1] = 1;
                    clk-=2*formula.get(1);
                }
                else if(table[1][1] == 1)
                {
                    table[0][1] = 0;
                    table[1][1] = 0;
                    table[2][1] = 1;
                    clk-=formula.get(1);
                }
                //else if(table[2][1] == 1);
            }
            else if(b == 2)
            {
                if(table[0][2] == 1)
                {
                    table[0][2] = 0;
                    table[1][2] = 1;
                    table[2][2] = 0;
                    ////////////////
                    table[0][2] = 0;
                    table[1][2] = 0;
                    table[2][2] = 1;
                    clk-=2*formula.get(2);
                }
                else if(table[1][2] == 1)
                {
                    table[0][2] = 0;
                    table[1][2] = 0;
                    table[2][2] = 1;
                    clk-=formula.get(2);
                }
                //else if(table[2][2] == 1);
            }
        }
        //return clk;
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
    
    moveHandle(clk,Ptime);
    System.out.println(clk);

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
    text(str(formula.get(1)), w/2+0.5*m, H+3.5*m);
    text(str(formula.get(0)), w/2-m2+0.5*m, H+3.5*m);
    text(str(formula.get(2)), w/2+m2+0.5*m, H+3.5*m);
    checkWin();
  }
  /////////////check if the user won or prints the finalvalue
  void checkWin(){
    int temp=clk%60;
    if(temp<0)
      temp+=60;
    if(table[1][0]==0 && table[1][1]==0 && table[1][2]==0 && temp==finalvalue){
      textAlign(CENTER);
      fill(255,255,0);
      text("YOU WON",w/2,H+7*m);
    }
    else{
      textAlign(CENTER);
      text(str(finalvalue),w/2,H+7*m);
    }
  }
}


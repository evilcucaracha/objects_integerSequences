int n=30, classn=1, repre=1;
sequence seq;

void setup()
{
  size(900, 690);
  background(255);
  seq = new abundant(n);
}

void draw()
{  
  switch(repre)
  {
    case 1:
      seq.draw_principal(n);
      break;
    case 2:
      seq.draw_curve(n);
      break;
    case 3:
      seq.draw_bars(n);
      break;
  }
  seq.outN(seq.n);
}

void keyPressed()
{
  if(keyCode==RIGHT)
  {
    if(classn==4)
      classn=1;
    else
      classn++;
  }
  if(keyCode==LEFT)
  {
    if(classn==1)
      classn=4;
    else
      classn--;
  }
  if(key=='+')
  {
    if(n<500)
      n++;
  }
  if(key=='-')
  {
    if(n>15)
      n--;
  }  
  if(classn==1)
    seq = new abundant(n);
  else
    if(classn==2)
      seq = new perfect(n);
    else
      if(classn==3)
        seq = new fibonacci(n);
      else
        if(classn==4)
          seq = new prime(n);
  if(keyCode==UP)
    if(repre<3)
      repre++;
    else
      repre = 1;
  if(keyCode==DOWN)
    if(repre>1)
      repre--;
    else
      repre = 3;
  redraw();
}
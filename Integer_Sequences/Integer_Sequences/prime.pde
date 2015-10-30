class prime extends sequence
{  
  int n;
  prime(int n)
  {
    super(n);
    //setRGB(0,180,0);
  }
  
  boolean evaluate (int n)
  {
    for(int i=2; i<n; i++)
      if(n % i==0)
        return false;
    return true;
  }
  
  int compute(int n)
  {
    if(evaluate(n))
      return n;
     else
       return 0;
  }

  void draw_principal(int m)
  {
    if(m <= 255)
      n=m;
    else
      n=255;
    background(0); 
    for(int i=1; i<=width; i++)
    {
      if(evaluate(i))
      {
        stroke(map(i,width,0,n,255-n),150,map(i,width,0,255-n,n));
        rect(i, 0, 0, height);
      }
    }
  }

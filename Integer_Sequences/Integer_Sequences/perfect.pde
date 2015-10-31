class perfect extends sequence
{
  int n;
  perfect(int n)
  {
    super(n);
    setRGB(0,180,0);
  }
  
  int compute(int n)
  {
    if(evaluate(n))
      return n;
     else
       return 0;
  }
  
  boolean evaluate(int n)
  {
    int[] div = div(n);
    int sum=0;
    for(int i=0; i<n/2; i++)
      sum+=div[i];
    if(sum==n)
      return true;
    else
      return false;
  }
  
  void draw_principal(int n)
  {
    background(0); 
    float x=0,y=0,x0=0,y0=0;
    float gr=(2*PI)/n;
    float[][] coor= new float[n][2];
    x0 = width/2 + cos(0) * 300;
    y0 = height/2 + sin(0) * 300;
    
    for(int i=0; i<n; i++)
    {
      fill(255);
      x = width/2 + cos(gr*(i+1)) * 300;
      y = height/2 + sin(gr*(i+1)) * 300;
      coor[i][0]=(x+x0)/2;
      coor[i][1]=(y+y0)/2;
      stroke(255);
      line(x0,y0, x,y);
      //line(x,y,width/2,height/2);
      int[] div = div(i+1);
      if(evaluate(i+1))
        for(int j=0;j<(i+1)/2;j++)
           if(div[j]!=0)
           {
             stroke(r,g,b);
             line(coor[div[j]-1][0],coor[div[j]-1][1],coor[i][0],coor[i][1]);
             fill(r,g,b);
           }
      textSize(13);
      text(i+1,coor[i][0],coor[i][1]);
      x0=x;
      y0=y; 
    }
  }
  
  void draw_bars(int n)
  {
    background(0);
    int divisor = n - 14;
    int alto;
    int ancho = width/4;
    int numBarra = 0;
    int base = height - 20;
    int numero = 1;
    int posicion = 0;
    boolean siguiente = false;
    while(numBarra < 4)
    {
      while(!siguiente)
      {
        numero++;
        if(evaluate(numero))
          siguiente = true;
      }
      fill(r,g,b);
      //stroke(map(posicion,width,0,n,255-n),150,map(posicion,width,0,255-n,n));
      if(numero / divisor < 1)
        alto=1;
      else
        alto = numero / divisor;
      rect(posicion, base - alto, ancho, alto);
      textSize(10);
      text(numero, posicion, base + 15);
      posicion += ancho;
      numBarra++;
      siguiente=false;
    }
  }
  
  void draw_curve(int n)
  {
    background(0);
    noFill();
    beginShape();
    int divisor = n - 14;
    int alto;
    int ancho = width/4;
    int numBarra = 0;
    int base = height - 20;
    int numero = 1;
    int posicion = 0;
    boolean siguiente = false;
    while(numBarra < 4)
    {
      while(!siguiente)
      {
        numero++;
        if(evaluate(numero))
          siguiente = true;
      }
      if(numero / divisor < 1)
        alto=1;
      else
        alto = numero / divisor;
      curveVertex(posicion, base - alto);
      textSize(10);
      text(numero, posicion, base + 15);
      posicion += ancho;
      numBarra++;
      siguiente=false;
    }
    curveVertex(width, height);

    endShape();
    
  }
  
}
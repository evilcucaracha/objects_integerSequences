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
    if(m<269)
      n=m-14;
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
  
  void draw_bars(int n)
  {
    background(0);
    int ancho = width/n;
    int numBarra = 0;
    int base = height - 20;
    int numero = 1;
    int posicion = 0;
    boolean siguiente = false;
    while(numBarra < n)
    {
      while(!siguiente)
      {
        numero++;
        if(evaluate(numero))
          siguiente = true;
      }
      fill(map(posicion,width,0,n,255-n),150,map(posicion,width,0,255-n,n));
      //stroke(map(posicion,width,0,n,255-n),150,map(posicion,width,0,255-n,n));
      rect(posicion, base - numero, ancho, numero);
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
    curveVertex(0, height);
    int ancho = width/n;
    int numBarra = 0;
    int base = height - 20;
    int numero = 1;
    int posicion = 0;
    boolean siguiente = false;
    while(numBarra < n)
    {
      while(!siguiente)
      {
        numero++;
        if(evaluate(numero))
          siguiente = true;
      }
      curveVertex(posicion, base - numero);
      textSize(10);
      text(numero, posicion, base + 15);
      posicion += ancho;
      numBarra++;
      siguiente=false;
    }
    curveVertex(posicion, base - numero);

    endShape();
  } 
}
abstract class sequence
{
  int n;
  sequence(int n)
  {
    this.n=n;
  }
  
  abstract boolean evaluate(int n);
  abstract int compute(int n);
  int r, g, b;
  
  void outN(int n)
  {
    stroke(255);
    textSize(30);
    text(n,width/10,height/10);
  }
  
  int[] div(int n)
  {
    int w=int(n/2);
    int[] div=new int [w];
    int k=0;
    for(int i=0; i<w; i++)
      div[i]=0;
    for(int i=1;i<n; i++)
      if(n%i==0)
      {
        div[k]=i;
        k++;
      }
    return div;
  }
  
  abstract void draw_principal(int n);
  abstract void draw_bars(int n);
  abstract void draw_curve(int n);
  
  void setn(int x)
  {
    n=x;
  }
  
  void setRGB(int x, int y, int z)
  {
    r=x;
    g=y;
    b=z;
  }
}
class fibonacci extends sequence
{
  //int n;  
  fibonacci(int n)
  {
    super(n);
    //setRGB(0,180,0);
  }
  
  boolean evaluate(int n)
  {
    return false;
  }
  
  int compute(int n)
  {
    //salida de la recursion
    if(n == 1)
      return 0;
    if(n == 2)
      return 1;
    //avance de la recursion
    if(n > 2)
      return compute(n-1) + compute(n-2);
    //Si n es negativo o 0
    return -1;
  }
 
  //las coordenadas x,y del punto donde se inicia el cuadro a pintar
  int x;
  int y;
  int x_centro;
  int y_centro;
  float grado_ini;
  float grado_finis;
  
  void draw_principal(int m)
  {
    if(m<34)
      n=m-14;
    else
      n=20;
    background(0); 
    x = width/2;
    y = height/2;
    /*se inicia un ciclo para pintar cada uno de los cuadros requeridos, 
    se inicia con el numero 2, por que fibonacci de 0 devuelbe -1 y fibonacci
    de 1 devuelbe 0, valores que no representarian ningun cuadro y podrian ser 
    contrproducentes en la logica del programa.*/
    for(int i=2; i<n+2; i++)
    {
      //este if tiene la funcionalidad de separar el primer valor (2), de los demas en la iteracion.
      if(i != 2)
      {
        if(i%4==0)
        {
          //se produce un movimiento del punto hacia abajo
          x -= compute(i-2);
          y += compute(i-1);
          x_centro = x;
          y_centro = y;
          grado_ini = 0;
          grado_finis = 0.5;
        }
        if(i%4==1)
        {
          //se produce un movimiento del punto hacia la izquierda
          x -= compute(i);
          y -= compute(i-2);
          x_centro = x + compute(i);
          y_centro = y;
          grado_ini = 0.5;
          grado_finis = 1;
        }
        if(i%4==2)
        {
          //se produce un movimiento del punto hacia arriba
          y -= compute(i);
          x_centro = x + compute(i);
          y_centro = y + compute(i);
          grado_ini = 1;
          grado_finis = 1.5;
        }
        if(i%4==3)
        {
          //se produce un movimiento del punto hacia la derecha
          x += compute(i - 1);
          x_centro = x;
          y_centro = y + compute(i);
          grado_ini = 1.5;
          grado_finis = 2;
        }        
      }    
      /*se selecciona un color que se encuentre entre 0 y 255, en sus tres campos, en la misma proporcion
      en que lo esta i entre 0 y el numero de cuadros a pintar*/
      fill(map(i, n, 0 , 0, 255));
      /*se dibuja un rectangulo con alto y ancho igual al valor correspondiente de fibonacci y
      con punto de origen en los valores de x,y definidos en el momento*/
      rect(x, y, compute(i), compute(i));
      stroke(map(i, n, 0 , 255, 0));
      //println(x+" "+y+" "+x_centro+" "+y_centro+" "+grado_ini+" "+grado_finis+" ");
      arc(x_centro, y_centro, compute(i)*2, compute(i)*2, grado_ini*PI, grado_finis*PI, OPEN);
      fill(255);
      textSize(i);
      text(compute(i),(x+x+compute(i))/2,(y+y+compute(i))/2);
      //escribe en consola el valor de fibonacci de cada numero que va pasando
      //println("fibo("+i+")= "+fibo(i));
    }
  }
  
  void draw_bars(int n)
  {
    
  }
  
  void draw_curve(int n)
  {
    
  }
  
}


//Food to be eaten by User
class FoodCircle
{
  //variables
  int COUNT = 500;
  //position
  float y[] = new float[COUNT];  
  float x[] = new float[COUNT];
  //movement and size
  float speedX[] = new float[COUNT];
  float speedY[] = new float[COUNT];
  float diaFood[] = new float[COUNT];
  //color variables
  float colorR[] = new float[255];
  float colorG[] = new float[255];
  float colorB[] = new float[255];

  //default constructor
  FoodCircle()
  {
    for (int i=0; i<COUNT; i++)
    {
      y[i] = random(0, 1000);
      x[i] = random(0, 2000);
      //collision function -- not working... yet
      for (int j = 0; j<COUNT; j++)
      {
        if (i==j)
        {
          break;
        }
        if (dist(x[i], x[j], y[i], y[j])< diaFood[i]/2 + diaFood[i]/2)
        {
          speedX[i] = speedX[i]*-1;
          speedY[i] = speedY[i]*-1;
        }
      }
      //randomizers for speed and size
      speedX[i] = random(-1, 1);
      speedY[i] = random(-1, 1);
      diaFood[i]= random(10, 15);
    }
    //color for statement
    for (int i=0; i<255; i++)
    {
      colorR[i] = random(0, 255);
      colorG[i] = random(0, 255);
      colorB[i] = random(0, 255);
    }
  }

  //draw/render function
  void Render()
  {
    for (int i=0; i<255; i++)
    {
      fill(colorR[i], colorG[i], colorB[i]);
    }
    for (int i=0; i<COUNT; i++)
    {
      ellipse(x[i], y[i], diaFood[i], diaFood[i]);
    }
  }

  //movement function
  void Move()
  {
    for (int i=0; i<COUNT; i++)
    {
      x[i] = x[i] + speedX[i];
      y[i] = y[i] + speedY[i];
      //bounce back
      if (x[i]>2000||x[i]<0)
      {
        speedX[i] = speedX[i]*-1;
      }
      if (y[i]>1000||y[i]<0)
      {
        speedY[i] = speedY[i]*-1;
      }
    }
  }
}

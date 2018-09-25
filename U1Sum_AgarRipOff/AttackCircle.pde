class AttackCircle
{
  int COUNT = 8;//Number of enemies
  int cCOUNT = 255;//color
  float x[] = new float[COUNT];//x position
  float y[] = new float[COUNT];//y position
  float diaAtt[] = new float[COUNT];//attacker size
  //color randomizing
  float colorR[] = new float[cCOUNT];
  float colorG[] = new float[cCOUNT];
  float colorB[] = new float[cCOUNT];
  //Enemy speed
  float speedX[] = new float[COUNT];
  float speedY[] = new float[COUNT];

  //Default Constructor for enemy circle
  AttackCircle()
  {
    for (int i=0; i<COUNT; i++)
    {
      //spawn point
      x[i] = random(0, 2000);
      y[i] = random(0, 1000);
      //size
      diaAtt[i] = random(50, 75);
      //color
      colorR[i] = random(0, 255);
      colorG[i] = random(0, 255);
      colorB[i] = random(0, 255);
      //speed
      speedX[i] = random(-5, 5);
      speedY[i] = random(-5, 5);
    }
  }
  void Render()//render/draw function
  {
    for (int i=0; i<COUNT; i++)
    {
      fill(colorR[i], colorG[i], colorB[i]);
      ellipse(x[i], y[i], diaAtt[i], diaAtt[i]);
    }
  }
  void Move()//Movement function
  {
    for (int i=0; i<COUNT; i++)
    {
      x[i] = x[i] + speedX[i];
      y[i] = y[i] + speedY[i];
      //bounce back function
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

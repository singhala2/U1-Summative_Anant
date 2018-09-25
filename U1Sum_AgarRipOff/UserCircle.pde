//new class user
class UserCircle
{
  //variables
  float y; 
  float x;
  float speedX;
  float speedY;
  float diaUser;
  float score;
  //color
  color c[] = new color [255];

//default constructor
  UserCircle()
  {
    y = height/2 + speedY;
    x = width/2 + speedX;
    diaUser = 100;
    speedX = 3;
    speedY = 3;
  }
  
  //render/draw function
  void Render()
  {
    fill(200, 0, 200);
    ellipse(x, y, diaUser, diaUser);
  }

//movement function
  void Move()
  {
    if (keyPressed)
    {
      if (key=='w')
      {
        y-=speedY;
      }
      if (key=='s')
      {
        y+=speedY;
      }
      if (key=='a')
      {
        x-=speedX;
      }
      if (key=='d')
      {
        x+=speedX;
      }
    }
  }
}

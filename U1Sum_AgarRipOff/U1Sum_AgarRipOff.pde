//library import //<>//
import processing.sound.*;

//load classes
UserCircle User;
FoodCircle Food;
AttackCircle Attack;
//Variables
int Scene; //Which Screen it is on
int Score;
//Background Grid Image
PImage grid;
//Music import
SoundFile file;
String audioName = "Reaper.mp3";
String path;

void setup()
{
  size(2000, 1000);
  //initialize Classes
  User = new UserCircle();
  Food = new FoodCircle();
  Attack = new AttackCircle();
  Scene = 1; //by default screen is game screen
  Score = 0;
  textSize(40); //resize text
  //load image
  grid = loadImage("agarbg.jpg");
  //Play music
  path = sketchPath(audioName);
  file = new SoundFile(this, "Reaper.mp3");
  file.play();
}

void draw()
{ 
  //Setting up scenes
  if (Scene == 1)
  {
    SceneOne();
  }
  if (User.diaUser<30)//condition needed to load scene 2
  {
    Scene = 2;
  }
  if (Scene == 2)
  {
    SceneTwo();
  }
}

//Game Scene (Screen)
void SceneOne()
{
  background(255, 255, 255);//white bg
  fill(255, 255, 0);//fill user circle
  //initialize class functions
  grid.resize(2000, 1000);
  image(grid, 0, 0);
  User.Render();
  User.Move();
  Food.Render();
  Food.Move();
  Attack.Render();
  Attack.Move();
  //user eats food for statement
  for (int i = 0; i<Food.COUNT; i++)
  {
    //if food circle and user circle are within a certain range of each other user eats food
    if (dist(Food.x[i], Food.y[i], User.x, User.y)<User.diaUser/2+Food.diaFood[i]/2)
    {
      User.diaUser += 2; //Growth of user
      //food "disappear"
      Food.x[i] = 20000;
      Food.y[i] = 20000;
      Score += 10; //Score
    }
  }
  //Enemy eats user for statement
  for (int i = 0; i<Attack.COUNT; i++)
  {
    if (dist(Attack.x[i], Attack.y[i], User.x, User.y)<User.diaUser/2+Attack.diaAtt[i]/2)
    {
      User.diaUser -= 2;//user shrinks
      Attack.diaAtt[i] += 2;//enemy grows
    }
  }
  fill(0, 0, 0); //make text black
  text(Score, 1800, 100); //display score
}

//Game Over scene/screen
void SceneTwo()
{
  background(0, 0, 0); //black bg
  fill(255, 255, 255); //white text
  text("Game Over", width/2 - 100, height/2);
  text(Score, 1800, 100);
  if (keyPressed)
  {
    if (key == 'r' || key == 'R')
    {
      reset();
    }
  }
}

//reset to original
void reset()
{
  User.diaUser = 100;
  User.x = width/2;
  User.y = height/2;
  for (int i=0; i<Attack.COUNT; i++)
    {
      //spawn point
      Attack.x[i] = random(0, 2000);
      Attack.y[i] = random(0, 1000);
      //size
      Attack.diaAtt[i] = random(50, 75);
      //color
      Attack.colorR[i] = random(0, 255);
      Attack.colorG[i] = random(0, 255);
      Attack.colorB[i] = random(0, 255);
      //speed
      Attack.speedX[i] = random(-5, 5);
      Attack.speedY[i] = random(-5, 5);
    }
        for (int i=0; i<Food.COUNT; i++)
    {
      Food.y[i] = random(0, 1000);
      Food.x[i] = random(0, 2000);
      //collision function -- not working... yet
      for (int j = 0; j<Food.COUNT; j++)
      {
        if (i==j)
        {
          break;
        }
        if (dist(Food.x[i], Food.x[j], Food.y[i], Food.y[j])< Food.diaFood[i]/2 + Food.diaFood[i]/2)
        {
          Food.speedX[i] = Food.speedX[i]*-1;
          Food.speedY[i] = Food.speedY[i]*-1;
        }
      }
      //randomizers for speed and size
      Food.speedX[i] = random(-1, 1);
      Food.speedY[i] = random(-1, 1);
      Food.diaFood[i]= random(10, 15);
    }
    Score = 0;
    Scene = 1;
}

Bacteria[] bacteria = new Bacteria[100];
Bacteria b1;

//declare bacteria variables here   
void setup()   
{ 
  size (600, 500);
  background (0);

  frameRate(1000);
  bacteria = new Bacteria[10];
  for (int i = 0; i < bacteria.length; i++) {
    int x = (int)(2 * width * Math.random());
    int y = (int)(2 * height * Math.random());
    int r = 20;
    int colorR = (int)(Math.random() * 255);
    int colorG = (int)(Math.random() * 255);
    int colorB = (int)(Math.random() * 255);

    bacteria[i] = new Bacteria(x, y, r, colorR, colorG, colorB);
  }

  b1 = new Bacteria(width/2, height/2, 3, 255, 34, 34);
  // b2 = bacteria(0, bacteria.length);

  //initialize bacteria variables here
}   
void draw()   
{   
  fill(0);
  b1.show();

  for (int i=0; i< bacteria.length; i++) {
    bacteria[i].show();
    bacteria[i].move();
  }

  mousePressed();
}  

void mousePressed() {
  for (int i =0; i< bacteria.length; i++) {
    bacteria[i].follow(mouseX, mouseY);
  }
}
class Bacteria    
{  
  float x_pos, y_pos, radius, bColor;
  float colorR, colorG, colorB;
  float speed = random(0, 1);
  float px;
  float py;
  float easing = 0.0005;

  public Bacteria(int x, int y, int radius, int colorR, int colorG, int colorB) {
    x_pos=x;
    y_pos= y;
    this.radius = radius;
    this.colorR = colorR;
    this.colorG = colorG;
    this.colorB = colorB;
  }

  void move() {
    x_pos += (float)(2* Math.random() - 1);
    y_pos += (float)(  Math.random() -1 );
  }

  void show() {
    pushMatrix();
    translate(x_pos, y_pos);
    fill(#42F2A7);
    float targetX = mouseX;
    float dx = targetX - px;
    px *= dx * easing;

    float targetY = mouseY;
    float dy = targetY - py;
    py *= dy * easing;

    ellipse(px, py, radius, radius);
    popMatrix();
  }


  void follow(float x, float y) {
    if (mousePressed) {
      if (x_pos >= x) {
        x_pos = x_pos - speed;
      } else if (x_pos <= x) {
        x_pos = x_pos + speed;
      }
      if (y_pos >=y) {
        y_pos = y_pos - speed;
      } else if (y_pos <= y) {
        y_pos = y_pos + speed;
      }
    }
  }

  void disperse(float dx, float dy) {
    if (x_pos >= dx) {
      x_pos = x_pos - speed;
    } else if (x_pos <= dx) {
      x_pos = x_pos + speed;
    }
    if (y_pos >=dy) {
      y_pos = y_pos - speed;
    } else if (y_pos <= dy) {
      y_pos = y_pos + speed;
    }
  }
  //lots of java!
}    

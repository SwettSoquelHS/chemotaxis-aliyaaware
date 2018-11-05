Bacteria[] bacteria = new Bacteria[100];
Bacteria b1;
//declare bacteria variables here   
void setup()   
{ 
  size (600, 500);
  background (0);
  frameRate(10000000);
  bacteria = new Bacteria[1000];
  for (int i = 0; i < bacteria.length; i++) {
    int x = (int)(2 * width * Math.random());
    int y = (int)(2 * height * Math.random());
    int r = (int)(5 * Math.random()) + 2;

    bacteria[i] = new Bacteria(x, y, r);
  }

  b1 = new Bacteria(width/2, height/2, 3);

  //initialize bacteria variables here
}   
void draw()   
{   
  b1.show();

  for (int i=0; i< bacteria.length; i++) {
    bacteria[i].show();
    bacteria[i].move();
  }
  //move and show the bacteria
  if (mousePressed){
    Bacteria.follow();
  }
}  

void mousePressed(){
  for (int i =0; i< bacteria.length; i++){
    bacteria[i].follow(mouseX, mouseY);
  }
}
class Bacteria    
{  
  float x_pos, y_pos, radius, bColor;
  float speed = random(0, 1);

  public Bacteria(int x, int y, int radius) {
    x_pos=x;
    y_pos= y;
    this.radius = radius;
  }

  void move() {
    x_pos += (float)(2 * Math.random() - 1);
    y_pos += (float)(2 *  Math.random() -1 );
  }

  void show() {
    pushMatrix();
    translate(x_pos, y_pos);
    fill(200, 0, 200);
    ellipse(0, 0, radius, radius);

    popMatrix();
  }
  
  
  void follow(float mX, float mY){
    if (x_pos >= mX) {
      x_pos = x_pos - speed;
    } else if (x_pos <= mX) {
      x_pos = x_pos + speed;
    }
    if (y_pos >= mY) {
      y_pos = y_pos - speed;
    } else if (y_pos <= mY) {
      y_pos = y_pos + speed;
    }
  
  }
  //lots of java!
}    

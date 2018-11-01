 Bacteria[] bacteria = new Bacteria[100];
 
 //declare bacteria variables here   
 void setup()   
 { 
   size (600, 500);
   background (0);
   
 	//initialize bacteria variables here   
 }   
 void draw()   
 {    
 	//move and show the bacteria   
 }  
 class Bacteria    
 {  
   int x_pos, y_pos, bColor;
   
   public Bacteria(int x, int y, int bColor){
     x_pos=x;
     y_pos= y;
     this.bColor = bColor;
   }
   
   void move(){
     
   }
   
   void show(){
     pushMatrix();
     translate(x_pos, y_pos);
     
     
     popMatrix();   
   }
 	//lots of java!   
 }    

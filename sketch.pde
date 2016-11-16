PImage img,black_b,image_load;
PrintWriter output;
 
int SQL;
float led_t;
byte[] pov_data; 
int line_num=200;
String _OUTPUT="";



void setup()
{
output = createWriter(_OUTPUT); 
black_b= createImage(SQL, SQL, RGB);
black_b.loadPixels();
for (int i = 0; i < black_b.pixels.length; i++) {  black_b.pixels[i] = color(0, 0, 0); }
black_b.updatePixels(); 
background(black_b);
 img = loadImage("myImage.jpg");
}
int l=0;
void draw() 
{
  if(l>=line_num) {noLoop();output.flush();output.close();}
  background(black_b);
  pushMatrix();
             imageMode(CENTER);  
             translate(SQL/2, SQL/2);
              rotate(radians(l*360/line_num));
              image(img, 0, 0);
  popMatrix();
  pushMatrix();
       for(int i=0;i<144;i++)
       {
         color c = get(int(i*led_t+led_t/2), int(SQL/2));
         output.print((char)red(c)+""+(char)green(c)+""+(char)blue(c));     
        // print((char)red(c)+""+(char)green(c)+""+(char)blue(c)+";");
          fill(c);
          rect(i*led_t, (SQL/2)-(led_t/2),led_t,led_t);
      }
    //  println();
   popMatrix();
  // delay(500);
  l++; 
}

void keyPressed() 
{
  output.flush();  // Writes the remaining data to the file
  output.close();  // Finishes the file
  exit();  // Stops the program
}



void mousePressed(){  loop();}


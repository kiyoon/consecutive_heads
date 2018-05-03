// Simulation program for below thread:
// https://math.stackexchange.com/questions/364038/expected-number-of-coin-tosses-to-get-five-consecutive-heads

int coin_x=0, coin_y=50;
int tries = 0;
PImage head;
PImage head_enhanced;
PImage tail;
int max_heads = 0;
int head_count=0;
boolean high_score = false;
void setup() {
  size(1520, 920);
  background(255);
  frameRate(30);
  head = loadImage("head.jpg");
  head_enhanced = loadImage("head_enhanced.jpg");
  tail = loadImage("tail.jpg");
}
void draw() {
  int flip = (int)random(0,2);
  if(flip == 1)
  {
    if(high_score)
    {
      image(head_enhanced, coin_x, coin_y, 70, 70);
    }
    else
    {
      image(head, coin_x, coin_y, 70, 70);
    }
    head_count++;
    if(head_count > max_heads)
    {
      max_heads = head_count;
      if(!high_score)
      {
        high_score = true;
        int x = coin_x;
        int y = coin_y;
        
        for(int i = 0; i < head_count; i++)
        {
          image(head_enhanced, x, y, 70, 70);
          x -= 50;
          if( x < 0)
          {
            x = width-70;
            y -= 50;
            if(y < 50)
            {
              y = height-70;
            }
          }
        }
      }
      
    }
  }
  else
  {
    image(tail, coin_x, coin_y, 70, 70);
    head_count = 0;
    high_score = false;
  }
  
  coin_x += 50;
  if(coin_x > width-70)
  {
    coin_x = 0;
    coin_y += 50;
  }
  
  if(coin_y > height-70)
  {
    coin_x = 0;
    coin_y=50;
  }
  
  tries++;

  fill(0);
  rectMode(CORNER);
  rect(0,0,width,50);
  fill(255);
  textSize(20);
  text("Tries: " + tries,10,30);
  text("Expected consecutive heads: log("+tries+"/2+1)/log2 = " + log(float(tries)/2+1)/log(2),350,30);
  text("Maximum consecutive heads: " + max_heads,1150,30);
}
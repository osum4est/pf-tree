float t = 0;

float len_dec = (float)2/3;

float randomAmount = PI/12;

ArrayList<Integer> ts = new ArrayList<Integer>();

int fractal = 0;

void setup() {
  size(800, 800);
  
  //frameRate(30);
}

void draw() {
  background(50);
  drawTree();
}

void drawTree() {
  fractal = 0;
  createFractal(width/2, height, 200, PI, 0);
  //createFractal(width/2, height/2, 100, PI/2, 0);
  //createFractal(width/2, height/2, 100, PI*3/2, 0);
  //createFractal(width/2, height/2, 100, 0, 0);
  t+=.001;
}

void createFractal(float startx, float starty, float len, float angle, int deep) {
  
  deep++;
  if (deep < 13) {
    if (ts.size() == fractal)
      ts.add((int)random(1, 10000));
    angle = fractal == 0 ? angle : map(noise(t+ts.get(fractal)), 0, 1, angle-randomAmount, angle+randomAmount);
    len = fractal == 0 ? len : map(noise(t+ts.get(fractal)), 0, 1, len-len*.1, len+len*.1);
    
    stroke(255 * deep / 13, 255 * deep / 13, 255 * deep / 13);
    line(startx, starty, startx + sin(angle) * len, starty + cos(angle) * len);
    
    fractal++;
    
    createFractal(startx + sin(angle) * len, starty + cos(angle) * len, len * len_dec, angle+PI/4, deep);
    createFractal(startx + sin(angle) * len, starty + cos(angle) * len, len * len_dec, angle-PI/4, deep);
    
    
  }
}
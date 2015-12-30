void setup() {
  size(640, 480);
  stroke(253, 184, 45);
  frameRate(15);
} 

int i = 0;
int counter = 0;
int blocksize = 10;

color firstColor = color(247, 167, 27);
color secondColor = color(27, 145, 247);

color activeColor = firstColor;

int[] onetwo = {1, 2, 3, 4};
int[] twothree = {2, 3, 1, 4};
int[] threefour = {3, 4, 1, 2};
int[] fourone = {4, 1, 2, 3};

int[] pattern = onetwo;

void switchColor() {
  if (activeColor == firstColor) {
    activeColor = secondColor;
  } else {
    activeColor = firstColor;
  }
  stroke(activeColor);
}

void drawline(int i, int pattern1, int pattern2) {
  int counter = 1;
  for (int x = 0; x < width; x = x+40) {
    if ((counter == pattern1) || (counter == pattern2)) {
      line (x, i, x+40, i);
    }
    counter = counter + 1;
    if (counter > 4) {
      counter = 1;
    }
  }
}

void draw() {
  if (counter == blocksize) {
    pattern = twothree;
  } else if (counter == blocksize*2) {
    pattern = threefour;
  } else if (counter == blocksize*3) {
    pattern = fourone;
  } else if (counter == blocksize*4) {
    pattern = threefour;
  } else if (counter == blocksize*5) {
    pattern = twothree;
  } else if (counter == blocksize*6) {
    pattern = onetwo;
    counter = 0;
  }

  drawline(i, pattern[0], pattern[1]);
  i++;
  counter++;
  switchColor();
  drawline(i, pattern[2], pattern[3]);
  i++;
  counter++;
  switchColor();

}
class Button {
  //Member Variables
  float x, y;
  int orientation;
  String val;
  boolean hover;
  color c1;
  // Constructor
  Button(float x, float y, int orientation, String val) {
    this.x = x;
    this.y = y;
    this.orientation = orientation;
    this.val = val;
    hover = false;
    c1 = color (65);
  }
  //Member Methods
  void display() {
    fill(c1);
    textAlign(CENTER);
    if (hover == true) {
      c1 = color(0, 110, 80) ;
    } else {
      c1 = color(0, 80, 60);
    };
    if (orientation == 1) {
      fill(c1);
      triangle(x, y-10, x+10, y+10, x-10, y+10);
      textSize(15);
      fill(255);
      text(val, x, y+8);
      textSize(1);
    } else if (orientation == 2) {
      fill(c1);
      triangle(x, y+10, x+10, y-10, x-10, y-10);
      textSize(15);
      fill(255);
      text(val, x, y+2);
      textSize(1);
    } else if (orientation == 3) {
      fill(c1);
      triangle(x-15, y, x+15, y-15, x+15, y+15);
      textSize(13);
      fill(255);
      text(val, x+4, y+5);
      textSize(1);
    } else if (orientation == 4) {
      fill(c1);
      triangle(x+15, y, x-15, y+15, x-15, y-15);
      textSize(17);
      fill(255);
      text(val, x-4, y+5);
      textSize(1);
    } else if (orientation == 5) {
      fill(c1);
      triangle(x, y+10, x+10, y-10, x-10, y-10);
      textSize(13);
      fill(255);
      text(val, x+2, y+3);
      textSize(1);
    }
  }
  void mouseOver(float tempX, float tempY) {
    if (orientation == 2 || orientation == 1 || orientation == 5) {
      if (tempX <= x+7 && tempX >= x-7 &&tempY <= y+10 && tempY >= y-10) {
        hover = true;
      } else {
        hover = false;
      }
    } else if (orientation == 3 || orientation == 4) {
      if (tempX <= x+15 && tempX >= x-15 &&tempY <= y+15 && tempY >= y-15) {
        hover = true;
      } else {
        hover = false;
      }
    }
  }
}

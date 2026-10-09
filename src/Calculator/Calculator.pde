// Lachlan Wayment | 15 Sept 2026 | Calculator
//The array to store the numbered buttons.
Button[] numButtons = new Button[10];
Button[] opButtons = new Button [12];
float l, r, result;
String op, displayVal;
boolean left, newEntry;
int factorial, tempInt;

void setup() {
  size(210, 110);
  //The variables that will run my calculator.
  l = 0;
  r = 0;
  result = 0;
  op = " ";
  displayVal = "0";
  left = true;
  newEntry = true;
  tempInt = 0;

  //The number buttons for my calculator.
  numButtons[0] = new Button(35, 90, 1, "0");
  numButtons[1] = new Button(50, 90, 2, "1");
  numButtons[2] = new Button(65, 90, 1, "2");
  numButtons[3] = new Button(80, 90, 2, "3");
  numButtons[4] = new Button(95, 90, 1, "4");
  numButtons[5] = new Button(110, 90, 2, "5");
  numButtons[6] = new Button(125, 90, 1, "6");
  numButtons[7] = new Button(140, 90, 2, "7");
  numButtons[8] = new Button(155, 90, 1, "8");
  numButtons[9] = new Button(170, 90, 2, "9");
  //The operator buttons for my calculator.
  opButtons[0] = new Button(35, 30, 2, "+");
  opButtons[1] = new Button(50, 30, 1, "-");
  opButtons[2] = new Button(65, 30, 2, "x");
  opButtons[3] = new Button(80, 30, 1, "÷");
  opButtons[4] = new Button(95, 30, 2, ".");
  opButtons[5] = new Button(110, 30, 1, "±");
  opButtons[6] = new Button(125, 30, 2, "^");
  opButtons[7] = new Button(140, 30, 1, "√");
  opButtons[8] = new Button(155, 30, 5, "x²");
  opButtons[9] = new Button(170, 30, 1, "!");
  // The equals and clear buttons for my calculator
  opButtons[10] = new Button(20, 60, 3, "CLR");
  opButtons[11] = new Button(190, 60, 4, "=");
}
// The code that will place my buttons and display on the screen
void draw() {
  background(0, 70, 40);
  drawDisplay();
  for (int i = 0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].mouseOver(mouseX, mouseY);
  }
  for (int i = 0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].mouseOver(mouseX, mouseY);
  }
}
void drawDisplay() {
  stroke(0);
  rectMode(CENTER);
  rect(width/2, 60, 130, 30);
  fill(0);
  textAlign(RIGHT);
  textSize(30);
  text(displayVal, width-43, 73);
  fill(255);
  stroke(255);
}
void mouseReleased() {
  // Update display with button clicked by user.
  for (int i = 0; i < numButtons.length; i++) {
    if (numButtons[i].hover == true) {
      handleEvent(numButtons[i].val, true);
    }
  }
  //Loop through opButtons
  for (int i = 0; i < opButtons.length; i++) {

    if (opButtons[i].hover == true) {
      handleEvent(opButtons[i].val, false);
    }
  }
  // Display Variables
  println("l: " +l);
  println("r: " +r);
  println("Result: " +result);
  println("Left: " + left);
  println("op: " +op);
  println("newEntry: " +newEntry);
  println("factorial: " +factorial);
}
void performCalc() {
  if (op == "+") {
    result = l + r;
  } else if (op == "-") {
    result = l - r;
  } else if (op == "x") {
    result = l * r;
  } else if (op == "÷") {
    result = l / r;
  } else if (op == "^") {
    result = pow(l, r);
  }
  displayVal = str(result);
  left = true;

  op = " ";

  l = result;
  r = 0;
  checkForDecimal();
}
void toggleSign() {
  if (left == true) {
    l *= -1;
    displayVal = str(l);
  } else if (newEntry == false ) {
    r *= -1;
    displayVal = str(r);
  }
}
void keyPressed() {
  println("keyCode:" + keyCode);
  for (int i = 0; i < numButtons.length; i++) {
    if (keyCode == 48 + i || keyCode == 96 + i) {
      handleEvent(numButtons[i].val, true);
    }
  }
  if (keyCode == 16 && keyCode == 61 || keyCode == 107) {
    handleEvent("+", false);
  } else {
    if (keyCode == 45 || keyCode == 109 ) {
      handleEvent("-", false);
    } else {
      if (keyCode == 16 && keyCode == 56 || keyCode == 106 || keyCode == 88) {
        handleEvent("x", false);
      } else {
        if (keyCode == 47 || keyCode == 111 ) {
          handleEvent("÷", false);
        } else {
          if (keyCode == 16 && keyCode == 54 ) {
            handleEvent("^", false);
          } else {
            if (keyCode == 8 ) {
              handleEvent("CLR", false);
            } else {
              if (keyCode == 61 || keyCode == 10 ) {
                handleEvent("=", false);
              } else {
                if (keyCode == 46 || keyCode == 110 ) {
                  handleEvent(".", false);
                } else {
                  if (keyCode == 16 && keyCode == 48 ) {
                    handleEvent("!", false);
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}
void handleEvent(String val, boolean isNum) {
  if (isNum == true) {
    //Check for "0"
    if (displayVal.equals("0")) {
      displayVal = val;
      l = float(displayVal);
    } else if (left == true) {

      displayVal = displayVal + val;
      l = float(displayVal);
    } else {
      if (newEntry == true ) {

        r = float(val);
        displayVal = str(r);
        newEntry = false;
      } else {
        displayVal = displayVal + val;
      }
      r = float(displayVal);
    }
  } else {
    String clicked = val;
    if (val == ("=")) {
      performCalc();
      displayVal = str(result);
    } else  if (val == ("CLR")) {
      l = 0;
      r = 0;
      result = 0;
      op = " ";
      displayVal = "0";
      left = true;
      newEntry = true;
    } else if (val == ("+") ||val == ("-")
      ||  val == ("x") ||val == ("÷") || val == ("^") ) {
      left = !left;
      op = clicked;
      newEntry = true;
      displayVal = op;
    } else if (val == ("±")) {
      toggleSign();
    } else if (val == ("√")) {
      if (left == true) {
        l = sqrt(l) ;
        displayVal = str(l);
      } else {
        r = sqrt(r);
        displayVal = str(r);
      }
    } else if (val == ("x²")) {
      if (left == true) {
        l = pow(l, 2);
        displayVal = str(l);
      } else {
        r = pow(r, 2);
        displayVal = str(r);
      }
    } else if (val == ("!")) {
      factorial = 1;
      if (left == true) {
        for (int p = 1; p <= l; p++) {
          factorial *= p;
        }
        l = factorial;
        displayVal = str(l);
      } else {
        for (int p = 1; p <= r; p++) {
          factorial *= p;
        }
        r = factorial;
        displayVal = str(r);
      }
    } else if (val == (".") ) {
      if (!displayVal.contains(".") ) {
        displayVal += ".";
        if (left == true);
      }
    }
  }
}
void checkForDecimal () {
  if (l == int(l)) {
    tempInt = int(l);
    l = tempInt;
  }
  if (r == int(r)) {
    tempInt = int(r);
    r = tempInt;
  }
}

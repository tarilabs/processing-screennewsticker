class NewsTick {
  String textValue;
  float x;     

  NewsTick(String n) {
    textValue = " | " + n;
  }
  
  void setX(float x) {
    this.x = x;
  }
  
  // Scroll the text and reset it when it gets far enough offscreen
  void move() {
    x = x - 1;
    if (x < resetX()) {
      x = width;
    } 
  }
  
  // Determines when the x position is to be considered far enough offscreen
  float resetX() {
    if (width-totalW > 0) {
      return 0-textW();
    } else {
      return width-totalW;
    }
  }

  // Display the text
  void display() {
    textFont(f);
    textAlign(LEFT);
    fill(255);
    text(textValue,x,height-10); 
  }
  
  // Return the width of this text
  float textW() {
    textFont(f);
    return textWidth(textValue); 
  }
}

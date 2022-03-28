class Candle {

  PVector location;
  PVector last;
  color c;
  boolean higher;
  float h = 10;
  int w = 10;
  float wickLength;

  Candle(PVector _location, PVector _last) {
    location = new PVector(_location.x, _location.y);
    last = _last;
    float difference = last.y - location.y;

    h = difference;

    wickLength = random(-difference/1.3, difference/1.3);
    if (location.y < last.y) {
      c = color(69, 137, 46);
    } else if (location.y > last.y) {
      c = color(233, 65, 61);
    }
  }

  void displayCandle() {
    push();
    stroke(255);
    fill(c);
    //translate(location.x,location.y);
    //box(w,h,10);
    rect(location.x, location.y, w, h);
    pop();
  }

  void displayWick() {

    push();
    strokeWeight(3);
    stroke(255);
    translate(0, 0, -1);
    line(location.x, location.y+wickLength, location.x, location.y-wickLength);
    pop();
  }

  void edgeCheck() {
    if (location.y > width) {

      location.y = 0;
    } 
    if (location.y < 0) {

      location.y = height;
    }
  }
}

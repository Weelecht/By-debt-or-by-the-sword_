class Currency {

  PVector location;
  String[] elements = {"$", "£", "¥", "€", "kr", "﷼", "₩", "ƒ"};
  String choice;
  float xOff = 0.1;
  float noiseSpeed = random(0.001,0.1);
  float randChoice = random(0,10);
  color c;


  Currency(PVector _location) {

    location = new PVector(_location.x, _location.y);
    choice = elements[round(random(0, elements.length-1))];
  }

  void displayCurrency() {
    float noise = map(noise(xOff), 0, 1, 0, 255);
    push();
    textSize(16);
    if(randChoice >= 5 ) {
      fill(69, 137, 46, noise);
    } if(randChoice <= 5) {
      fill(233, 65, 61, noise);
    }
    translate(location.x, location.y, -2);
    text(choice, 0, 0);
    pop();
    xOff += noiseSpeed;
  }
}

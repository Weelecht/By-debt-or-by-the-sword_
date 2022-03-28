ArrayList<Candle> candles;
ArrayList<Currency> currencies;
int offSet = 12;
int offSetAccumulation;
float noiseOffset = 10;
float noiseStart = 1;
int skip = 20;

//make array of chars
String[] words = {"B", "y", "", "d", "e", "b", "t", "", "o", "r", "", "b", "y", "", "t", "h", "e", "", "s", "w", "o", "r", "d", "_"};
ArrayList <String> newWords;
int i = 0;
int time = 0;

void setup() {

  size(1080, 1080, P3D); 
  rectMode(CENTER);
  smooth();
  candles = new ArrayList();
  newWords = new ArrayList();
  currencies = new ArrayList();
  //Candle array init
  for (int i = 0; i < 1; i++) {
    candles.add(new Candle(new PVector(0, 0), new PVector(0, 0)));
  }
  //init background
  for (int x = 0; x < width + skip; x+= skip) {
    for (int y = 0; y < height + skip; y+= skip) {
      currencies.add(new Currency(new PVector(x, y)));
    }
  }
}

void draw() {
  background(12, 17, 32);


  push();
  generateText();
  displayText();

  translate(width-offSetAccumulation, 0);
  for (int i = 0; i < candles.size(); i++) {
    Candle c = candles.get(i);

    c.displayCandle();
    c.displayWick();
    c.edgeCheck();

    if (candles.size()>100) {
      candles.remove(0);
    }
  }
  pop();
  for (int j = 0; j < currencies.size(); j++) {
    Currency cu = currencies.get(j);

    cu.displayCurrency();
  }
  createCandle(getLastPosition());
  offSetAccumulation += offSet;
}

void createCandle(PVector _location) {
  delay(50);
  candles.add(new Candle(_location, getLastPosition()));
}
float randomChange() {

  float change = map(noise(noiseStart), 0, 1, 0, 100);
  noiseStart += noiseOffset;
  return change;
}

PVector getLastPosition() {
  int last = candles.size()-1;
  Candle getLast = candles.get(last);
  //println(getLast.location);
  PVector nextCandle = new PVector(getLast.location.x+offSet, getLast.location.y+random(-randomChange(), randomChange()));
  return nextCandle;
}

void generateText() {
  textSize(58);
  push();
  translate(10, 0, 0);
  if (i < words.length) {
    //String currentChar = words.charAt(i);
    String currentChar = words[i];
    newWords.add(currentChar);
    String formatted = newWords.toString().replace(",", "");
    text(formatted, 0, height/2);
    i++;
  }
  pop();
}

void displayText() {
  push();
  translate(10, 0, 0);
  for (int j = 0; j < newWords.size(); j++) {
    text(newWords.toString().replace(",", ""), 0, height/2);
    if (newWords.size() == words.length & time%100 ==0) { 
      //resetting the words here
      time = 0;
      for (int k = 0; k < words.length; k++) {
        newWords.remove(j);
      }
      i=0;
    }
  }
  time+=1;
  pop();
}

//edit the files "script1.txt" etcetera to change the scripts

import processing.pdf.*;

int colorscheme;
color bgcolor;
int defaultsize;
int boldsize;
String fontname;
String boldfontname;
int bigsize;
PFont titlefont;
PFont ylfont;
color boldcolor;
PFont tlfont;
color textcolor;
PFont smallfont;
int titlesize;
color titlecolor;
int x;
int y;
String specrule;
String title;
String tragset;
String loops;
int days;
String[] incidents;
String[] culprits;
String[] characters;
String[] roles;
String mainplot;
String sub1;
String sub2;
String scriptnumber;
color circlecolor;

void setcolor() {
  if (colorscheme == 0) {
    titlecolor = color(120, 190, 190);
    bgcolor = color(70, 15, 8);
    circlecolor = color(0,150,190);
  } else if (colorscheme == 1) {
    titlecolor = color(224, 0, 21);
    bgcolor = color(11, 5, 20);
    circlecolor = color(224,0,21);
  } else if (colorscheme == 2) {
    titlecolor = color(216, 160, 60);
    bgcolor = color(37, 50, 47);
    circlecolor = color(216,160,60);
  }
}

void drawCard(int x,int y,int width,int height, int r, int g, int b) {
  int windowsize = 10;
  PGraphics card = createGraphics(width,height);
  card.beginDraw();
  card.loadPixels();

  color[][] newpixels = new color[width][height];
  float[][] oldpixels = new float[width][height];

  for (int i = 0; i<(height); i++){
    for (int j = 0; j<(width); j++){
      oldpixels[j][i] = random(1);
    }
  }

  for (int i = 0; i<(height); i++){
    for (int j = 0; j<(width); j++){
      int numpix = 0;
      float tothue = 0.;
      for (int yo = -windowsize; yo<=windowsize;yo++) {
        for (int xo = -windowsize; xo<=windowsize;xo++) {
          if ((yo+j) > 0 && (yo+j) < width && (xo+i) > 0 && (xo+i) < height){
            numpix++;
            tothue = tothue + oldpixels[yo+j][xo+i];
          }
        }
      }
      newpixels[j][i] = color(r*2*tothue/numpix,g*2*tothue/numpix,b*2*tothue/numpix);
    }
  }



  for (int i = 0; i<(height); i++){
    for (int j = 0; j<(width); j++){
      card.pixels[j + i*width] = newpixels[j][i];
    }
  }


  card.updatePixels();
  card.endDraw();
  image(card,x,y,width,height);
}

void loadDataFromFile(String filename) {
  int lineon;
  String[] lines = loadStrings(filename);
  title = lines[0].substring(6);
  if (lines[1].charAt(7) == '0') {
    colorscheme = 0;
  }
  if (lines[1].charAt(7) == '1') {
    colorscheme = 1;
  } 
  if (lines[1].charAt(7) == '2') {
    colorscheme = 2;
  } 
  tragset = lines[2].substring(5);
  mainplot = lines[3].substring(6);
  sub1 = lines[4].substring(6);
  sub2 = lines[5].substring(6);
  loops = lines[6].substring(7);
  days = Integer.valueOf(lines[7].substring(6));
  scriptnumber = lines[8].substring(3);
  lineon = 10;
  while (!lines[lineon].equals("roles:")) {
    lineon++;
  }
  characters = new String[lineon-9];
  lineon = 10;
  while (!lines[lineon].equals("roles:")) {
    characters[lineon-9] = lines[lineon];
    lineon++;
  }
  lineon++;
  int oldlineon = lineon;
  int numroles = 0;
  while (!lines[lineon].equals("incidents:")) {
    lineon++;
    numroles++;
  }
  lineon = oldlineon;
  int roleon = 0;
  roles = new String[numroles];
  while (!lines[lineon].equals("incidents:")) {
    roles[roleon] = lines[lineon];
    lineon++;
    roleon++;
  }
  lineon++;
  incidents = new String[25];
  for (int i = 0; i < days; i++) {
    incidents[i] = lines[lineon+i].substring(3);
  }
  lineon = lineon+days;
  lineon++;
  roleon = 0;
  culprits = new String[25];
  while (!lines[lineon].equals("special rule (can be multiple lines):")) {
    culprits[roleon] = lines[lineon];
    lineon++;
    roleon++;
  }
  lineon++;
  specrule = "";
  while (lineon < lines.length){
    specrule = specrule + lines[lineon] + "\n";
    lineon++;
  }
}

void drawProtagCard() {

  fill(0);

  

  rect(0, 0, 500, 700, 20);


  drawCard(22,22,456,662,int(red(bgcolor)),int(green(bgcolor)),int(blue(bgcolor)));

  ///GENERATES PROTAG CARD



  x = 60;
  y = 406;

  drawCircle(48,48,44,scriptnumber);

  textFont(ylfont);
  fill(boldcolor);

  text("Tragedy set :", 96, 56);
  text("Number of loops :", 96, 56+27);
  text("Days per loop :", 96, 56+27+27);

  text("Day", 82, 190);
  text("Incident", 170, 190);
  text("Special rule", 82, 562);



  textFont(tlfont);

  pushMatrix();
  translate(x, y);
  rotate(-HALF_PI);
  translate(-x, -y);
  fill(textcolor);
  //textSize(30);
  text("Protagonists card", x, y);
  popMatrix();

  
  textFont(smallfont);

  text(tragset, 255, 57);
  text(str(days), 275, 111);
  text(loops, 308, 83);
  textLeading(19);
  text(specrule, 82, 588);

  for (int i = 0; i < days; i++) {
    rect(77, 224+33*i, 392, 2);
    text(str(i+1), 81, 221+33*i);
    text(incidents[i], 170, 221+33*i);
  }
}

void drawCircle(int x,int y,int size,String label) {
  noFill();
  stroke(200);
  
  strokeWeight(size*3/44);
  line(x,y+size*32/44,x,y+size*38/44);
  strokeWeight(size*2/44);
  line(x,y,x,y-size*32/44);
  line(x,y,x-size*20/44,y);
  line(x,y+size*32/44,x,y+size);
  strokeWeight(size*1/44);
  line(x,y,x-size*25/44,y+size*25/44);
  line(x,y,x-size*25/44,y-size*25/44);
  line(x,y,x,y-size*40/44);
  line(x,y,x-size*40/44,y);
  line(x,y,x+size*28/44,y);
  line(x,y,x+size*28/44*sqrt(3)/2,y+size*30/44*1/2);
  line(x,y,x+size*28/44*sqrt(3)/2,y-size*30/44*1/2);
  
  strokeWeight(size*3/44);
  arc(x,y,size*64/44,size*64/44,PI/4.,PI*13./8.);
  arc(x,y,size*54/44,size*54/44,PI*5./8.,PI*7./8.);
  strokeWeight(size*2/44);
  arc(x,y,size*54/44,size*54/44,PI*17./16.,PI*25./16.);
  //strokeWeight(size*1/44);
  arc(x,y,size*52/44,size*52/44,-PI/4.,PI*3./8.);
  
  strokeWeight(size/44);
  circle(x,y+size*26/44,size*8/44);
  fill(circlecolor);
  strokeWeight(size/88);
  circle(x,y,size);
  noStroke();
  
  
  PFont numFont = createFont(boldfontname, size*.75);
  textFont(numFont);
  fill(250);
  textAlign(CENTER, CENTER);
  text(label,x,y-size*3/44);
  textAlign(LEFT);
}

///GENERATES MM CARD

void drawMMCard() {

  

  fill(0);

  rect(0, 0, 500, 700, 20);

  drawCard(22,22,456,662,int(red(bgcolor)),int(green(bgcolor)),int(blue(bgcolor)));

  titlefont = createFont(boldfontname, titlesize);
  textFont(titlefont);
  fill(titlecolor);

  text(title, 95, 64);

  textFont(ylfont);
  
  drawCircle(48,48,44,scriptnumber);
  textFont(ylfont);
  fill(boldcolor);
  text("Main plot :", 81, 120);
  text("Subplots :", 81, 147);
  text("Cast", 81, 195);
  text("Role", 284, 195);
  text("Day", 81, 537);
  text("Incident", 143, 537);
  text("Culprit", 323, 537);

  textFont(tlfont);

  pushMatrix();
  translate(x, y);
  rotate(-HALF_PI);
  translate(-x, -y);
  fill(textcolor);
  //textSize(30);
  text("Mastermind card", x, y);
  popMatrix();

  textFont(smallfont);

  text(mainplot, 210, 120);
  text(sub1, 199, 147);
  text(sub2, 199, 168);

  for (int i = 0; i < characters.length; i++) {
    rect(77, 224+25*i, 392, 2);
    text(characters[i], 82, 221+25*i);
    try {
      text(roles[i], 284, 221+25*i);
    } 
    catch (ArrayIndexOutOfBoundsException e) {
      text("Person", 284, 221+25*i);
    }
  }

  int j = 0;
  for (int i = 0; i < days; i++) {
    if (incidents[i].length() > 0) {
      rect(77, 561+25*j, 392, 2);
      text(str(i+1), 81, 560+25*j);
      text(incidents[i], 143, 560+25*j);
      text(culprits[j], 323, 560+25*j);
      j++;
    }
  }
}

void setup() {
  size(1700, 2200, PDF, "printable.pdf");
  //settings
  //START EDITING HERE
  colorscheme = 0; //0 is base game, 1 is midnight circle, 2 is cosmic evil

  //script info
  title = "GOHDA CULPRIT THEORY";
  days = 6;
  loops = "3 or 4";
  tragset = "Rokkenjima Murders";
  mainplot = "A Magical Chef";
  sub1 = "Oh Desire";
  sub2 = "Expanding Wastelines";
  //Be sure to add \n characters to wrap the line if you change the below:
  specrule = "None";
  characters = new String[] {
    "Gohda", 
    "George", 
    "Kanon", 
    "Kinzo", 
    "Kumasawa", 
    "Genji", 
    "Krauss", 
  };
  roles = new String[] {
    "Magical Chef", 
    "Big Guy", 
    "Cutie", 
    "Goldsmith", 
  };
  incidents = new String[] {
    "", 
    "Tiny Bombs", 
    "", 
    "", 
    "Lunar Hospitality", 
    "Mackerel Incident", 
    "", 
    "", 
  };
  culprits = new String[] {
    "Kinzo", 
    "Krauss", 
    "Kumasawa", 
  };

  defaultsize = 19;
  boldsize = 21;
  titlesize = 26;
  bigsize = 32;
  fontname = "Lucida Sans";
  boldfontname = "Lucida Sans Bold.otf";
  textcolor = color(230);
  titlecolor = color(120, 190, 190);
  bgcolor = color(66, 10, 5);
  boldcolor = color(206, 180, 0);
  circlecolor = color(0,150,190);
  background(255);

  setcolor();
  
  
  

  strokeWeight(0);

  ylfont = createFont(boldfontname, boldsize);
  tlfont = createFont(boldfontname, bigsize);
  smallfont = createFont(fontname, defaultsize);
  
  
  loadDataFromFile("script1.txt");
  setcolor();
  pushMatrix();
  translate(800, 70);
  rotate(HALF_PI);
  drawProtagCard();
  popMatrix();
  pushMatrix();
  translate(1600, 70);
  rotate(HALF_PI);
  drawMMCard();
  popMatrix();
  
  loadDataFromFile("script2.txt");
  setcolor();
  pushMatrix();
  translate(800, 590);
  rotate(HALF_PI);
  drawProtagCard();
  popMatrix();
  pushMatrix();
  translate(1600, 590);
  rotate(HALF_PI);
  drawMMCard();
  popMatrix();
  
  loadDataFromFile("script3.txt");
  setcolor();
  pushMatrix();
  translate(800, 1110);
  rotate(HALF_PI);
  drawProtagCard();
  popMatrix();
  pushMatrix();
  translate(1600, 1110);
  rotate(HALF_PI);
  drawMMCard();
  popMatrix();
  
  loadDataFromFile("script4.txt");
  setcolor();
  pushMatrix();
  translate(800, 1630);
  rotate(HALF_PI);
  drawProtagCard();
  popMatrix();
  pushMatrix();
  translate(1600, 1630);
  rotate(HALF_PI);
  drawMMCard();
  popMatrix();
  
  
}

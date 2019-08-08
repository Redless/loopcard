import processing.pdf.*;

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


void drawProtagCard() {

  fill(0);

  

  rect(0, 0, 500, 700, 20);

  fill(bgcolor);

  rect(22, 22, 456, 662, 10);

  ///GENERATES PROTAG CARD



  x = 60;
  y = 406;


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

  text(tragset, 250, 57);
  text(str(days), 275, 111);
  text(loops, 308, 83);
  text(specrule, 82, 588);

  for (int i = 0; i < days; i++) {
    rect(77, 224+33*i, 392, 2);
    text(str(i+1), 81, 221+33*i);
    text(incidents[i], 170, 221+33*i);
  }
}

///GENERATES MM CARD

void drawMMCard() {

  

  fill(0);

  rect(0, 0, 500, 700, 20);

  fill(bgcolor);

  rect(22, 22, 456, 662, 10);

  titlefont = createFont(boldfontname, titlesize);
  textFont(titlefont);
  fill(titlecolor);

  text(title, 95, 64);

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
  int colorscheme = 0; //0 is base game, 1 is midnight circle, 2 is cosmic evil

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
  //STOP EDITING HERE

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
  background(255);

  if (colorscheme == 1) {
    titlecolor = color(224, 0, 21);
    bgcolor = color(6, 9, 33);
  } else if (colorscheme == 2) {
    titlecolor = color(216, 160, 60);
    bgcolor = color(30, 54, 48);
  }

  strokeWeight(0);

  ylfont = createFont(boldfontname, boldsize);
  tlfont = createFont(boldfontname, bigsize);
  smallfont = createFont(fontname, defaultsize);
  
  

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
  
  /*pushMatrix();
  translate(800, 590);
  rotate(HALF_PI);
  drawProtagCard();
  popMatrix();
  pushMatrix();
  translate(1600, 590);
  rotate(HALF_PI);
  drawMMCard();
  popMatrix();
  
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
  
  */
}

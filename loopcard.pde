//settings
boolean isprotagcard = false;
int colorscheme = 0; //0 is base game, 1 is midnight circle, 2 is cosmic evil
String filename = "gohdamm.png";

//script info
String title = "GOHDA CULPRIT THEORY";
int days = 6;
String loops = "3 or 4";
String tragset = "Rokkenjima Murders";
String mainplot = "A Magical Chef";
String sub1 = "Oh Desire";
String sub2 = "Expanding Wastelines";
//Be sure to add \n characters to wrap the line if you change the below:
String specrule = "None";
String[] culprits = new String[] {
  "",
  "Kinzo",
  "",
  "",
  "Krauss",
  "Kumasawa",
  "",
  "",
};
String[] incidents = new String[] {
  "",
  "Tiny Bombs",
  "",
  "",
  "Lunar Hospitality",
  "Mackerel Incident",
  "",
  "",
};
String[] characters = new String[] {
  "Gohda",
  "Krauss",
  "George",
  "Kanon",
  "Kinzo",
  "Kumasawa",
  "Genji",
};
String[] roles = new String[] {
  "Magical Chef",
  "Person",
  "Big Guy",
  "Cutie",
  "Goldsmith",
  "Person",
  "Person",
  "",
  "",
};

//Below this is where only knowers dare tread

int defaultsize = 19;
int boldsize = 22;
int titlesize = 26;
int bigsize = 32;
String fontname = "Lucida Sans";
String boldfontname = "Lucida Sans Demibold";
color textcolor = color(230);
color titlecolor = color(120,190,190);
color bgcolor = color(66,10,5);
color boldcolor = color(206,180,0);
if (colorscheme == 1) {
  titlecolor = color(224,0,21);
  bgcolor = color(6,9,33);
} else if (colorscheme == 2) {
  titlecolor = color(216,160,60);
  bgcolor = color(30,54,48);
}

size(500,700);

strokeWeight(0);

fill(0);

rect(0,0, 500, 700, 20);

fill(bgcolor);

rect(22,22,456,662,10);

//fill(0,128,178);

//circle(50,58,48);

if (isprotagcard) { ///GENERATES PROTAG CARD

int x = 60;
int y = 406;

PFont ylfont = createFont(boldfontname,boldsize);
textFont(ylfont);
fill(boldcolor);

text("Tragedy set :",96,56);
text("Number of loops :",96,56+27);
text("Days per loop :",96,56+27+27);

text("Day",82,190);
text("Incident",170,190);
text("Special rule",82,562);


PFont tlfont = createFont(boldfontname,bigsize);
textFont(tlfont);

pushMatrix();
translate(x,y);
rotate(-HALF_PI);
translate(-x,-y);
fill(textcolor);
//textSize(30);
text("Protagonists card", x,y);
popMatrix();

PFont smallfont = createFont(fontname,defaultsize);
textFont(smallfont);

text(tragset,250,57);
text(str(days),275,111);
text(loops,308,83);
text(specrule,82,588);

for (int i = 0; i < days; i++) {
  rect(77, 224+33*i, 392, 2);
  text(str(i+1),81,221+33*i);
  text(incidents[i],170, 221+33*i);
}

} else {  ///GENERATES MM CARD
  
int x = 60;
int y = 406;

PFont titlefont = createFont(boldfontname,titlesize);
textFont(titlefont);
fill(titlecolor);

text(title,95,64);

PFont ylfont = createFont(boldfontname,boldsize);
textFont(ylfont);
fill(boldcolor);

text("Main plot :",81,120);
text("Subplots :",81,147);
text("Cast",81,195);
text("Role",284,195);
text("Day",81,537);
text("Incident",143,537);
text("Culprit",323,537);

PFont tlfont = createFont(boldfontname,bigsize);
textFont(tlfont);

pushMatrix();
translate(x,y);
rotate(-HALF_PI);
translate(-x,-y);
fill(textcolor);
//textSize(30);
text("Mastermind card", x,y);
popMatrix();

PFont smallfont = createFont(fontname,defaultsize);
textFont(smallfont);

text(mainplot,210,120);
text(sub1,199,147);
text(sub2,199,168);

for (int i = 0; i < characters.length; i++) {
  rect(77, 224+25*i, 392, 2);
  text(characters[i],82,221+25*i);
  text(roles[i],284, 221+25*i);
}

int j = 0;
for (int i = 0; i < days; i++) {
  if (incidents[i].length() > 0) {
    rect(77, 561+25*j, 392, 2);
    text(str(i+1),81,560+25*j);
    text(incidents[i],143, 560+25*j);
    text(culprits[i],323, 560+25*j);
    j++;
  }
}

}

save(filename);

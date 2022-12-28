LetterGenerator lg;
String input = "noms";


void setup() {
  size(1400, 600, P2D);
  lg = new LetterGenerator(input, 0, height/2);
  noLoop();
}

void draw() {
  background(150,130,255);
  
  lg.run(); 
}


class Letter {
  
  PShape s;
  PVector position;
  PVector[] vertices;
  float spread = 0.2;
  
  Letter(PShape _s, float x, float y) {
    s = _s;
    position = new PVector(x, y);
    vertices = new PVector[s.getVertexCount()];
  }
  
  void update() {
    for (int i=0; i<vertices.length; i++) {
      vertices[i] = s.getVertex(i);
      vertices[i].add(new PVector(random(-spread, spread), random(-spread, spread)));
      s.setVertex(i, vertices[i]);
    }
  }
  
  void draw() {
    shapeMode(CENTER);
    shape(s, position.x, position.y);
  }
  
  void run() {
    update();
    draw();
  }
  
}
class LetterGenerator {
  
  PShape n, o, m, s;
  ArrayList<Letter> letters;
  PVector position;
  float offset = 180;
  color col;
 
  LetterGenerator(String input, float x, float y) {
    initShapes();
    position = new PVector(x, y);
    letters = new ArrayList<Letter>();
     
    for (int i=0; i<input.length(); i++) {     
      char ch = input.charAt(i);
      
      float px = position.x + ((i+1) * offset);
      float py = position.y;
      
    switch(ch) {
        case 'n':
          letters.add(new Letter(n, px, py));
          break;
        case 'o':
          letters.add(new Letter(o, px, py));
          break;
        case 'm':
          letters.add(new Letter(m, px, py));
          break;
        case's':
           letters.add(new Letter(s, px, py));
      }
    }
    
  }

  void initShapes() {
    n = createShape();
    n.beginShape();
    n.fill(242,69,0);
    n.translate(170, 60);
    n.vertex(31,103);
    n.bezierVertex(10,110,6,107,-76,-33);
    n.bezierVertex(-78,45,-60,101,-94,105);
    n.bezierVertex(-110,99,-135,110,-122,0);
    n.bezierVertex(-121,-57,-142,-149,-101,-147);
    n.bezierVertex(-53,-138,-71,-98,-6,-35);
    n.bezierVertex(-6,-69,-12,-104,-7,-138);
    n.bezierVertex(-1,-156,12,-155,25,-151);
    n.bezierVertex(47,-150,51,-136,50,-124);
    n.bezierVertex(38,-53,72,107,29,101);
    n.endShape(CLOSE);
    
    o = createShape();
    o.beginShape();
    
    o.translate(300, 50);
    o.fill(0,255,0);
  
  o.vertex(-139,-154);
  o.bezierVertex(-118,-175,-68,-198,-87,60);
  o.bezierVertex(-15,69,44,21,44,107);
  o.bezierVertex(-16,107,-132,154,-137,107);
  o.bezierVertex(-137,21,-148,-92,-137,-151);
 



    o.endShape(CLOSE);   
    
    m = createShape();
 m.beginShape();
 m.translate(100, 10);
  m.vertex(575,123);
  m.bezierVertex(523,37,593,-72,537,-43);
  m.bezierVertex(522,-36,454,17,485,137);
  m.bezierVertex(463,140,462,144,433,134);
  m.bezierVertex(433,48,433,-36,509,-93);
  m.bezierVertex(624,-146,607,-52,616,70);
  m.bezierVertex(660,17,684,-45,718,-103);
  m.bezierVertex(753,-109,768,-101,770,-85);
  m.bezierVertex(780,-11,795,69,800,135);
  m.bezierVertex(777,136,755,138,743,137);
  m.bezierVertex(739,92,735,48,732,4);
  m.bezierVertex(690,47,660,136,575,122);
 
    m.endShape(CLOSE);
    
        s = createShape();
    s.beginShape();
    s.fill(255,160,200);
    s.translate(-100, 10);
 
  s.vertex(178,58);
  s.bezierVertex(203,114,237,79,246,68);
  s.bezierVertex(301,5,279,-12,252,-31);
  s.bezierVertex(212,-37,175,-11,171,-90);
  s.bezierVertex(187,-190,251,-157,311,-125);
  s.bezierVertex(299,-111,309,-127,288,-102);
  s.bezierVertex(274,-114,255,-125,233,-121);
  s.bezierVertex(220,-116,200,-107,207,-87);
  s.bezierVertex(198,-48,241,-69,259,-60);
  s.bezierVertex(288,-53,294,-47,307,-31);
  s.bezierVertex(330,3,304,37,290,70);
  s.bezierVertex(268,84,263,104,226,113);
  s.bezierVertex(190,125,171,113,167,104);
  s.bezierVertex(157,93,150,80,154,69);
  s.bezierVertex(162,65,170,61,178,57);
    s.endShape(CLOSE);
 
  }
  
  void update() {
    //
  }
  
  void draw() {
    for (Letter letter : letters) {
      letter.run();
    }
  }
  
  void run() {
    update();
    draw();
  }

}

FlowField f;
LeftTeam lt;
RightTeam rt;
Ball b;
Rim r;

PImage court, bball;

int ltScore = 0, rtScore = 0;

PVector leftRim = new PVector(80, 400);
PVector rightRim = new PVector(1220, 400);

ArrayList<LeftTeam> ltplayers = new ArrayList<LeftTeam>();
ArrayList<RightTeam> rtplayers = new ArrayList<RightTeam>();
ArrayList<Ball> ball = new ArrayList<Ball>();
ArrayList<Rim> rim = new ArrayList<Rim>();
ArrayList<FlowField> saveFlow = new ArrayList<FlowField>();

void nextGame() {
  ltplayers.clear();
  rtplayers.clear();
  ball.clear();

  //b.nextGame();
  //lt.nextGame();
  //rt.nextGame();

  f = new FlowField(20);
  f.rightTeamFF();
  f.leftTeamFF();

  ltplayers.add(new LeftTeam(100, 100));
  ltplayers.add(new LeftTeam(100, 400));
  ltplayers.add(new LeftTeam(100, 700));
  ltplayers.add(new LeftTeam(280, 250));
  ltplayers.add(new LeftTeam(280, 550));

  rtplayers.add(new RightTeam(1200, 100));
  rtplayers.add(new RightTeam(1200, 400));
  rtplayers.add(new RightTeam(1200, 700));
  rtplayers.add(new RightTeam(1020, 250));
  rtplayers.add(new RightTeam(1020, 550));

  ball.add(new Ball());
}

void setup() {
  size(1300, 800);
  //background(255);

  court = loadImage("Court.jpg");
  court.resize(1300, 800);
  bball = loadImage("bball.png");

  f = new FlowField(20);
  f.rightTeamFF();
  f.leftTeamFF();
  //f.displayR();
  //f.displayL();
  //f.displayRRim();

  ltplayers.add(new LeftTeam(100, 100));
  ltplayers.add(new LeftTeam(100, 400));
  ltplayers.add(new LeftTeam(100, 700));
  ltplayers.add(new LeftTeam(280, 250));
  ltplayers.add(new LeftTeam(280, 550));

  rtplayers.add(new RightTeam(1200, 100));
  rtplayers.add(new RightTeam(1200, 400));
  rtplayers.add(new RightTeam(1200, 700));
  rtplayers.add(new RightTeam(1020, 250));
  rtplayers.add(new RightTeam(1020, 550));

  ball.add(new Ball());

  rim.add(new Rim(leftRim));
  rim.add(new Rim(rightRim));
}

//void mouseClicked() {
  
//}

void draw() {
  background(court);
  

  //for (FlowField f : saveFlow) {
  //f.rightTeamFF();
  //f.leftTeamFF();
  //f.displayR();
  //f.displayL();
  //}

  for (Rim r : rim) {
    r.display();
  }

  for (LeftTeam lt : ltplayers) {
    lt.follow(f);
    lt.update();
    lt.display();
  }

  for (RightTeam rt : rtplayers) {
    rt.follow(f);
    rt.update();
    rt.display();
  }

  for (Ball b : ball) {
    textSize(50);
    fill(0,0,0);
    text(b.sendRTScore(), 500, 100);
    text(":", 640, 100);
    text(b.sendLTScore(), 800, 100);
    b.display();
    b.update();
    if (b.ifRTScore || b.ifLTScore) {
      nextGame();
    }else if (b.getLocationX() < 0 || b.getLocationX() > 1300) {
      nextGame();
    }
  }

  //if a team scores
}
